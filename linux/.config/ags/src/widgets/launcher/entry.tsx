import { App, Gtk } from 'astal/gtk3';

import Apps from 'gi://AstalApps';

export const Entry = ({ app }: { app: Apps.Application }) => {
  const onClicked = () => {
    App.get_window('launcher')!.hide();
    app.launch();
  };
  return (
    <button className="entry" onClicked={onClicked}>
      <box>
        <box valign={Gtk.Align.CENTER} vertical>
          <label className="name" truncate xalign={0} label={app.name} />
          {app.description && (
            <label
              className="description"
              wrap
              xalign={0}
              label={app.description}
            />
          )}
        </box>
      </box>
    </button>
  );
};
