import { execAsync, timeout, GLib, property } from 'astal';
import GObject, { register } from 'astal/gobject';
import { interval, Time } from 'astal/time';

import Hyprland from 'gi://AstalHyprland';

import NotificationService from './notifier';

const TMP_DIR = GLib.get_tmp_dir();
const HOME_DIR = GLib.get_home_dir();

const now = () => GLib.DateTime.new_now_local().format('%Y-%m-%dT%H:%M:%S');

type Input = 'area' | 'active' | 'output';

@register({ GTypeName: 'Screencapture' })
export default class Screencapture extends GObject.Object {
  static instance: Screencapture;
  static get_default() {
    if (!this.instance) this.instance = new Screencapture();

    return this.instance;
  }

  #notifier = NotificationService.get_default();
  #recording = false;
  #timer = 0;

  #filepath?: String;
  #dir?: String;
  #interval?: Time;

  @property(Boolean)
  get recording() {
    return this.#recording;
  }

  @property(Number)
  get timer() {
    return this.#timer;
  }

  private createTemp(color: string) {
    const path = `${TMP_DIR}/${color}.png`;
    execAsync(`convert -size 100x100 xc:${color} ${path}`);
    return path;
  }

  public async pickColor() {
    const color = await execAsync('hyprpicker');
    execAsync(['wl-copy', color]).catch(print);
    const image = this.createTemp(color);

    // wait before sending the notification so
    // we can create the temp image first
    timeout(1000, () => {
      this.#notifier.send({
        app: 'Hyprpicker',
        image: image,
        message: color,
        expiry: '3000',
      });
    });
  }

  public async screenshot(input: Input) {
    timeout(2000, async () => {
      // just call notify-send inside the script
      // since the image takes time to generate
      await execAsync(`${HOME_DIR}/bin/screenshot ${input}`);
    });
  }

  public async record() {
    const date = now();
    const filename = `${date}.mp4`;

    this.#dir = `${HOME_DIR}/videos/screenrecordings`;
    const filepath = `${this.#dir}/${filename}`;
    this.#filepath = filepath;

    this.#recording = true;
    this.notify('recording');

    const display = Hyprland.get_default().get_focused_monitor().name;

    timeout(1000, () =>
      execAsync(['wf-recorder', '-a', '-o', display, '-f', filepath]).catch(
        print,
      ),
    );

    this.#timer = 0;
    this.notify('timer');

    this.#interval = interval(1000, () => {
      this.#timer++;
      this.notify('timer');
    });
  }

  private reset() {
    this.#recording = false;
    this.notify('recording');
    this.#interval?.cancel();
    this.#timer = 0;
    this.notify('timer');
    this.#dir = '';
    this.#filepath = '';
  }

  public async stop() {
    if (!this.#recording) {
      return;
    }

    await execAsync(['killall', '-INT', 'wf-recorder']);
    this.reset();

    this.#notifier.send({
      app: 'Screenrecording',
      message: `Screenrecording saved to ${this.#filepath}`,
      expiry: '3000',
      actions: [
        {
          action: 'xdg-open',
          path: this.#dir,
          message: 'Directory',
        },
        {
          action: 'xdg-open',
          path: this.#filepath,
          message: 'View',
        },
      ],
    });
  }

  constructor() {
    super();
    this.pickColor = this.pickColor.bind(this);
    this.createTemp = this.createTemp.bind(this);
    this.screenshot = this.screenshot.bind(this);
    this.record = this.record.bind(this);
    this.stop = this.stop.bind(this);
  }
}
