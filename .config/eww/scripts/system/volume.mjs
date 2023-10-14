#!/usr/bin/env zx

$.verbose = false;

const INCREMENT = 5;

const volume = async () => {
  const { stdout } = await $`pamixer --get-volume`;
  return stdout.trim();
};

if (argv.volume) {
  echo(await volume());
}

const muted = async () => {
  const { stdout } = await $`pamixer --get-mute`;
  return stdout.trim() === 'true';
};

if (argv.muted) {
  echo(await muted());
}

const bluetooth = async () => {
  const { stdout } = await $`pactl get-default-sink`;
  return stdout.trim() === 'bluez_output';
};

const down = async () => {
  await $`pamixer -d ${INCREMENT}`;
};

if (argv.down) {
  await down();
}

const up = async () => {
  await $`pamixer -i ${INCREMENT}`;
};

if (argv.up) {
  await up();
}

const mute = async () => {
  await $`pamixer -t`;
};

if (argv.mute) {
  await mute();
}

const set = async (volume) => {
  await $`pamixer --set-volume ${volume}`;
};

if (argv.set) {
  await set(argv.set);
}

const update = async () => {
  await $`canberra-gtk-play -i audio-volume-change -d 'changevolume'`;
};

const status = async () => {
  return {
    muted: await muted(),
    value: await volume(),
    bluetooth: await bluetooth(),
  };
};

if (argv.status) {
  echo(JSON.stringify(await status()));
}

if (argv.up || argv.down || argv.mute || argv.set) {
  // call this always since there is no harm in
  // running an "empty" update
  await update(JSON.stringify(await status()));
}
