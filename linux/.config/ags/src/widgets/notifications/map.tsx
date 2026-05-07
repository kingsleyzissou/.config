import { Gtk } from 'astal/gtk3';
import Notifd from 'gi://AstalNotifd';
import { Notification } from './notification';
import { type Subscribable } from 'astal/binding';
import { Variable, timeout } from 'astal';

const TIMEOUT_DELAY = 3000;

export class NotificationMap implements Subscribable {
  private map: Map<number, Gtk.Widget> = new Map();
  private var: Variable<Array<Gtk.Widget>> = Variable([]);

  private notifiy() {
    this.var.set([...this.map.values()].reverse());
  }

  constructor() {
    const notifd = Notifd.get_default();
    notifd.connect('notified', (_, id) => {
      this.set(
        id,
        Notification({
          notification: notifd.get_notification(id)!,

          onHoverLost: () => this.delete(id),

          setup: () =>
            timeout(TIMEOUT_DELAY, () => {
              this.delete(id);
            }),
        }),
      );
    });

    notifd.connect('resolved', (_, id) => {
      this.delete(id);
    });
  }

  private set(key: number, value: Gtk.Widget) {
    this.map.get(key)?.destroy();
    this.map.set(key, value);
    this.notifiy();
  }

  private delete(key: number) {
    this.map.get(key)?.destroy();
    this.map.delete(key);
    this.notifiy();
  }

  get() {
    return this.var.get();
  }

  subscribe(callback: (list: Array<Gtk.Widget>) => void) {
    return this.var.subscribe(callback);
  }
}
