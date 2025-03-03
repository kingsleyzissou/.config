import { Astal, Gdk } from 'astal/gtk3';
import { bind } from 'astal';

import { NotificationMap } from './map';

export const Notifications = (gdkmonitor: Gdk.Monitor) => {
  const { TOP, RIGHT } = Astal.WindowAnchor;
  const notifications = new NotificationMap();

  return (
    <window
      name="notifications"
      className="notifications"
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | RIGHT}
      visible={bind(notifications).as((n) => n.length > 0)}
    >
      <box vertical>{bind(notifications)}</box>
    </window>
  );
};
