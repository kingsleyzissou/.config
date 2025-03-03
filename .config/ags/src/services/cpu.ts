import { Variable } from 'astal';
import GObject, { register, property } from 'astal/gobject';
import { interval, Time } from 'astal/time';

import GTop from 'gi://GTop';

const INTERVAL = 2000;

type Resource = {
  idle: number;
  total: number;
  percentage: number;
};

@register({ GTypeName: 'CPU' })
export default class CPU extends GObject.Object {
  static instance: CPU;
  static get_default() {
    if (!this.instance) this.instance = new CPU();

    return this.instance;
  }

  #previous = Variable<Resource>(this.getUsage());
  #usage = Variable<Resource>(this.getUsage());
  #interval?: Time;

  @property(Object)
  get usage() {
    return this.#usage.get();
  }

  public getUsage(): Resource {
    try {
      const cpu = new GTop.glibtop_cpu();
      GTop.glibtop_get_cpu(cpu);

      // Calculate the differences from the previous to current data
      const total = cpu.total - this.#previous.get().total;
      const idle = cpu.idle - this.#previous.get().idle;

      const percentage = total > 0 ? (total - idle) / total : 0;

      return { idle, total, percentage };
    } catch {
      return {
        idle: 0,
        total: 0,
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
