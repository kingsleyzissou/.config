import { App, Astal, Gdk, Gtk } from 'astal/gtk3';
import { Variable } from 'astal';

import ScreenCaptureService from '@services/screencapture';
import { hideOnEscape } from '@utilities';

const onEnter = (callback: Function) => {
  App.get_window('screencapture')!.hide();
  callback();
};

type ItemProps = {
  label: string;
  icon: string;
  action: Function;
};

const Item = ({ icon, action }: ItemProps) => {
  return (
    <button
      className="item"
      onClick={() => onEnter(action)}
      onKeyPressEvent={(_, event) => {
        if (event.get_keyval()[1] === Gdk.KEY_Return) {
          onEnter(action);
        }
      }}
    >
      <box>
        <box valign={Gtk.Align.CENTER} vertical>
          <icon icon={icon} />
        </box>
      </box>
    </button>
  );
};

export const ScreenCapture = (gdkmonitor: Gdk.Monitor) => {
  const screencapture = ScreenCaptureService.get_default();

  const visible = Variable(false);

  return (
    <window
      name="screencapture"
      className="screencapture"
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
      <centerbox className="container">
        <centerbox halign={Gtk.Align.CENTER}>
          <box valign={Gtk.Align.END}>
            <Item
              icon="computer-apple-ipad-symbolic"
              label="Screen"
              action={() => {
                screencapture.screenshot('output');
              }}
            />
            <Item
              icon="view-switcher-symbolic"
              label="Window"
              action={() => {
                screencapture.screenshot('active');
              }}
            />
            <Item
              icon="selection-opaque-symbolic"
              label="Selection"
              action={() => {
                screencapture.screenshot('area');
              }}
            />
            <box className="separator" />
            <Item
              icon="screencast-recorded-symbolic"
              label="Record Screen"
              action={() => {
                screencapture.record();
              }}
            />
          </box>
        </centerbox>
      </centerbox>
    </window>
  );
};
