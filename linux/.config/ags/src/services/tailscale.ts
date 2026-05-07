import GObject, { register, property } from 'astal/gobject';
import { exec } from 'astal/process';
import { interval, Time } from 'astal/time';

const INTERVAL = 2000;
const STOPPED = 'Tailscale is stopped.';

@register({ GTypeName: 'Tailscale' })
export default class Tailscale extends GObject.Object {
  static instance: Tailscale;
  static get_default() {
    if (!this.instance) this.instance = new Tailscale();

    return this.instance;
  }

  #enabled = this.connection();
  #interval?: Time;

  @property(Boolean)
  get enabled() {
    return this.#enabled;
  }

  public connection() {
    try {
      const status = exec('tailscale status').split('\n');
      return status[0] !== STOPPED;
    } catch {
      // if the call fails, there is no active vpn connection,
      // so we can just return an empty string rather than
      // trying to handle the error
      return false;
    }
  }

  public up() {
    exec(['sudo', 'tailscale', 'up', '--ssh']);
  }

  public down() {
    exec(['sudo', 'tailscale', 'down']);
  }

  public toggle() {
    if (this.#enabled) {
      this.down();
      return;
    }
    this.up();
  }

  public poll() {
    this.#interval = interval(INTERVAL, () => {
      this.#enabled = this.connection();
      this.notify('enabled');
    });
  }

  public drop() {
    this.#interval?.cancel();
  }

  constructor() {
    super();
    this.up = this.up.bind(this);
    this.down = this.down.bind(this);
    this.toggle = this.toggle.bind(this);
    this.connection = this.connection.bind(this);
    this.drop = this.drop.bind(this);
    this.poll = this.poll.bind(this);
    this.poll();
  }
}
