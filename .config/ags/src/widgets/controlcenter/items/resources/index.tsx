import { Gtk } from 'astal/gtk3';

import { Battery } from './battery';
import { CPU } from './cpu';
import { Storage } from './storage';

export const Resources = () => {
  return (
    <box className="item" halign={Gtk.Align.CENTER} hexpand>
      <Battery />
      <CPU />
      <Storage />
    </box>
  );
};
