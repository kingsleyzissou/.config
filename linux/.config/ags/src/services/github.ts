import GObject, { register, property } from 'astal/gobject';
import { exec } from 'astal/process';
import { interval, Time } from 'astal/time';

const INTERVAL = 2000;
const CAUGHT_UP = 'All caught up!';

@register({ GTypeName: 'Github' })
export default class Github extends GObject.Object {
  static instance: Github;
  static get_default() {
    if (!this.instance) this.instance = new Github();

    return this.instance;
  }

  #notifications = 0;
  #interval?: Time;

  @property(Number)
  get notifications() {
    return this.#notifications;
  }

  public list() {
    const notifications = exec(`gh notify -s`).split('\n');
    if (notifications[0] === CAUGHT_UP) {
      return 0;
    }
    return notifications.length;
  }

  public poll() {
    this.#interval = interval(INTERVAL, () => {
      this.#notifications = this.list();
      this.notify('notifications');
    });
  }

  public drop() {
    this.#interval?.cancel();
  }

  constructor() {
    super();
    this.list = this.list.bind(this);
    this.drop = this.drop.bind(this);
    this.poll = this.poll.bind(this);
    this.poll();
  }
}
