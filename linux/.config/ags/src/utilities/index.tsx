import { GLib } from 'astal';
import { Gdk, Gtk } from 'astal/gtk3';

export const fileExists = (path: string) => {
  return GLib.file_test(path, GLib.FileTest.EXISTS);
};

type Self = InstanceType<typeof Gtk.Widget>;

export const hideOnEscape = (self: Self, event: Gdk.Event) => {
  if (event.get_keyval()[1] === Gdk.KEY_Escape) {
    self.hide();
  }
};
