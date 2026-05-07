import { App, Astal, Gdk, Gtk } from 'astal/gtk3';
import { Variable } from 'astal';

import {
  Actions,
  Date,
  Levels,
  Media,
  Resources,
  Session,
  Tools,
} from './items';

import { hideOnEscape } from '@utilities';

const Separator = () => <box className="separator" heightRequest={2} hexpand />;

export const ControlCenter = (gdkmonitor: Gdk.Monitor) => {
  const visible = Variable(false);

  return (
    <window
      name="controlcenter"
      className="controlcenter"
      anchor={
        Astal.WindowAnchor.TOP |
        Astal.WindowAnchor.BOTTOM |
        Astal.WindowAnchor.RIGHT |
        Astal.WindowAnchor.LEFT
      }
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.IGNORE}
      application={App}
      layer={Astal.Layer.OVERLAY}
      keymode={Astal.Keymode.ON_DEMAND}
      visible={visible()}
      onKeyPressEvent={hideOnEscape}
    >
      <box className="container">
        <box halign={Gtk.Align.END}>
          <button className="hidden" />
          <box valign={Gtk.Align.START} vexpand={false}>
            <Tools />
            <box className="settings" vertical>
              <Session close={() => visible.set(!visible.get())} />
              <Date />
              <Separator />
              <Actions />
              <Levels />
              <Media />
              <Separator />
              <Resources />
            </box>
          </box>
        </box>
      </box>
    </window>
  );
};
