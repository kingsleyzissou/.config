#!/usr/bin/env zx

$.verbose = false;

const active = async () => {
  const { stdout } = await $`dunstctl is-paused`;
  return stdout.trim();
};

if (argv.toggle) {
  const a = await active();
  await $`gsettings set org.gnome.desktop.sound event-sounds ${a}`;
  await $`dunstctl set-paused toggle`;
  process.exit(0);
}

console.log('Usage: notifications.mjs <toggle>');
process.exit(2);
