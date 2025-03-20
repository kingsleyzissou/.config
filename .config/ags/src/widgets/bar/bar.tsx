import { App, Astal, Gdk, Gtk } from 'astal/gtk3';

import {
  Audio,
  Battery,
  Brightness,
  Github,
  Network,
  Recording,
  Search,
  Settings,
  Spotify,
  Time,
  Workspaces,
} from './items';

export const Bar = (gdkmonitor: Gdk.Monitor) => {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;

  return (
    <window
      name="bar"
      className="bar"
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={App}
    >
      <centerbox>
        <box className="bar left" hexpand halign={Gtk.Align.START}>
          <Workspaces />
        </box>
        <box className="bar center">
          <Time />
        </box>
        <box className="bar right" hexpand halign={Gtk.Align.END}>
          <Spotify />
          <box className="box right">
            <Recording />
            <Search />
            <Battery />
            <Network />
            <Audio />
            <Brightness />
            <Settings />
          </box>
        </box>
      </centerbox>
    </window>
  );
};
