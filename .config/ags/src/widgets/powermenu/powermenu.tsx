import { exec } from 'astal';
import { App, Astal, Gdk, Gtk } from 'astal/gtk3';

import { hideOnEscape } from '@utilities';

const onEnter = (action: string) => {
  exec(action);
  App.get_window('powermenu')!.hide();
};

type ItemProps = {
  label: string;
  icon: string;
  action: string;
};

const Item = ({ label, icon, action }: ItemProps) => {
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
          <label label={label} />
        </box>
      </box>
    </button>
  );
};

export const Powermenu = (gdkmonitor: Gdk.Monitor) => {
  return (
    <window
      name="powermenu"
      className="powermenu"
      anchor={
        Astal.WindowAnchor.TOP |
        Astal.WindowAnchor.BOTTOM |
        Astal.WindowAnchor.RIGHT |
        Astal.WindowAnchor.LEFT
      }
      exclusivity={Astal.Exclusivity.IGNORE}
      keymode={Astal.Keymode.ON_DEMAND}
      application={App}
      gdkmonitor={gdkmonitor}
      layer={Astal.Layer.OVERLAY}
      visible={false}
      onKeyPressEvent={hideOnEscape}
    >
      <centerbox className="container">
        <centerbox halign={Gtk.Align.CENTER}>
          <box valign={Gtk.Align.CENTER}>
            <Item
              label="Lock"
              icon="system-lock-screen-symbolic"
              action="loginctl lock-session"
            />
            <Item
              label="Reboot"
              icon="system-reboot-symbolic"
              action="systemctl reboot"
            />
            <Item
              label="Shutdown"
              icon="system-shutdown-symbolic"
              action="systemctl poweroff"
            />
            <Item
              label="Logout"
              icon="system-log-out-symbolic"
              action="hyprctl dispatch exit 0"
            />
            <Item
              label="Suspend"
              icon="moon-filled-symbolic"
              action="systemctl suspend"
            />
          </box>
        </centerbox>
      </centerbox>
    </window>
  );
};
