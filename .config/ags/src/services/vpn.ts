import GObject, { register, property } from 'astal/gobject';
import { interval, Time } from 'astal/time';
import { exec } from 'astal/process';

const INTERVAL = 2000;

@register({ GTypeName: 'Vpn' })
export default class Vpn extends GObject.Object {
  static instance: Vpn;
  static get_default() {
    if (!this.instance) this.instance = new Vpn();

    return this.instance;
  }

  #name = this.connection();
  #interval?: Time;

  @property(Boolean)
  get enabled() {
    return this.#name.length > 0;
  }

  @property(String)
  get name() {
    if (this.enabled) {
      return this.#name.split(' ')[0];
    }
    return '';
  }

  public connection() {
    try {
      return exec(
        `bash -c "nmcli --fields NAME,TYPE con show --active | grep vpn"`,
      );
    } catch {
      // if the call fails, there is no active vpn connection,
      // so we can just return an empty string rather than
      // trying to handle the error
      return '';
    }
  }

  public poll() {
    this.#interval = interval(INTERVAL, () => {
      this.#name = this.connection();
      this.notify('name');
    });
  }

  public drop() {
    this.#interval?.cancel();
  }

  constructor() {
    super();
    this.connection = this.connection.bind(this);
    this.drop = this.drop.bind(this);
    this.poll = this.poll.bind(this);
    this.poll();
  }
}
