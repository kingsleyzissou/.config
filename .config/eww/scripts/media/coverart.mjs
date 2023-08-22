#!/usr/bin/env zx

$.verbose = false;

const mktemp = async (name) => {
  const tempfile = `${process.env.HOME}/.cache/eww/${name}.png`;
  await $`touch ${tempfile}`;
  return tempfile;
};

const curl = async (tmp) => {
  const url = await $`playerctl -p spotify metadata mpris:artUrl`;
  await $`curl -o ${tmp} ${url}`;
};

// https://github.com/AlphaTechnolog/dotfiles/blob/dkwm/cfg/dk/eww/scripts/music/songart.sh
const convert = async (tmp, cover) => {
  await $`convert ${tmp} -gravity center +repage -alpha set -channel A \
    -sparse-color Barycentric '%[fx:w*2/32],0 transparent  %[fx:w+0.5],0 opaque' \
    -evaluate multiply 0.45 \
    ${cover}`;
};

const main = async () => {
  const tmp = await mktemp('tmp');
  const cover = await mktemp('cover');
  await curl(tmp);
  await convert(tmp, cover);
  return cover;
};

const cover = await main();
echo(cover);
