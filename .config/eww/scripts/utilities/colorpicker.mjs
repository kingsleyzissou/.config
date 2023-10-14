#!/usr/bin/env zx

$.verbose = false;

const pick = async () => {
  const { stdout } = await $`hyprpicker`;
  const color = stdout.trim();
  return color;
};

const notify = async (color) => {
  await $`convert -size 100x100 xc:${color} /tmp/mycol.png`;
  await $`dunstify -t 2000 -i /tmp/mycol.png "Hyprpicker" ${color}`;
};

const copy = async (color) => {
  $`wl-copy ${color}`.nothrow();
  $`pkill wl-copy`.nothrow();
};

const color = await pick();
await notify(color);
await copy(color);
