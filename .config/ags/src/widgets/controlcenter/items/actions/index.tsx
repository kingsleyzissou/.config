import { Gtk } from 'astal/gtk3';

import { Bluetooth, DoNotDisturb, Tailscale, Vpn, Wifi } from './buttons';

export const Actions = () => {
  return (
    <box className="item" halign={Gtk.Align.CENTER} hexpand>
      <Wifi />
      <Bluetooth />
      <Vpn />
      <Tailscale />
      <DoNotDisturb />
    </box>
  );
};
