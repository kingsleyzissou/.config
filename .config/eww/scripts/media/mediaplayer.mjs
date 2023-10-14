#!/usr/bin/env zx

$.verbose = false;

const player = argv.player || '%any,spotify';

const exit = () => {
  process.exit(0);
};

if (argv.toggle) {
  await $`playerctl --player ${player} play-pause`;
  exit();
}

if (argv.next) {
  await $`playerctl --player ${player} next`;
  exit();
}

if (argv.previous) {
  await $`playerctl --player ${player} previous`;
  exit();
}

console.log(
  'Usage: mediaplayer.mjs <toggle|next|previous> [--player <player>]'
);
process.exit(2);
