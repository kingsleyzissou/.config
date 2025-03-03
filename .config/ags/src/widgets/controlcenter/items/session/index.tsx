import { App, Gtk } from 'astal/gtk3';

export const Session = ({ close }: { close: Function }) => {
  return (
    <box className="item session" halign={Gtk.Align.END}>
      <button
        onClick={() => {
          App.get_window('powermenu')?.show();
        }}
      >
        <icon icon="system-shutdown-symbolic" />
      </button>
      <button onClick={() => close()}>
        <icon icon="window-close-symbolic" />
      </button>
    </box>
  );
};
