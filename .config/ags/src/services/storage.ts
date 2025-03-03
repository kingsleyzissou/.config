import { Variable } from 'astal';
import GObject, { register, property } from 'astal/gobject';
import { interval, Time } from 'astal/time';

import GTop from 'gi://GTop';

const INTERVAL = 2000;

type Resource = {
  used: number;
  total: number;
  percentage: number;
  free: number;
};

@register({ GTypeName: 'Storage' })
export default class Storage extends GObject.Object {
  static instance: Storage;
  static get_default() {
    if (!this.instance) this.instance = new Storage();

    return this.instance;
  }

  #usage = Variable<Resource>(this.getUsage());
  #interval?: Time;

  @property(Object)
  get usage() {
    return this.#usage.get();
  }

  public getUsage() {
    try {
      const currentFsUsage = new GTop.glibtop_fsusage();
      GTop.glibtop_get_fsusage(currentFsUsage, '/');

      const total = currentFsUsage.blocks * currentFsUsage.block_size;
      const free = currentFsUsage.bavail * currentFsUsage.block_size;
      const used = total - free;

      return {
        used,
        total,
        free,
        percentage: used / total,
      };
    } catch {
      return {
        used: 0,
        total: 0,
        free: 0,
        percentage: 0,
      };
    }
  }

  public poll() {
    this.#interval = interval(INTERVAL, () => {
      this.#usage.set(this.getUsage());
      this.notify('usage');
    });
  }

  public drop() {
    this.#interval?.cancel();
  }

  constructor() {
    super();
    this.getUsage = this.getUsage.bind(this);
    this.drop = this.drop.bind(this);
    this.poll = this.poll.bind(this);
    this.poll();
  }
}
