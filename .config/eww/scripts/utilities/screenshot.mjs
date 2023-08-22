#!/usr/bin/env zx

$.verbose = false;

const mktemp = async (name) => {
  const tempfile = `/tmp/${name}.png`;
  await $`touch ${tempfile}`;
  return tempfile;
};

const date = async () => {
  const { stdout } = await $`date -Iseconds | cut -d'+' -f1`;
  return stdout.trim();
};

const output = async (save) => {
  if (save) {
    const d = await date();
    return `/home/kingsley/pictures/screenshots/screenshot-${d}.png`;
  }
  return mktemp('output');
};

const display = async () => {
  const { stdout } = await $`hyprctl monitors -j`;
  return JSON.parse(stdout).find((d) => d.focused == true);
};

const slurp = async () => {
  const { stdout } = await $`slurp`;
  return stdout.trim();
};

const grim = async (tmp, save) => {
  if (save) {
    const { name } = await display();
    await $`grim -o ${name} ${tmp}`;
    return;
  }
  const area = await slurp();
  await $`grim -g ${area} ${tmp}`;
};

const mask = async (image, height, width, raw) => {
  const mask = await mktemp('mask');
  const tmp = await mktemp('temp');
  await $`convert -size "${raw}" xc:none -draw "roundrectangle 0,0,${width},${height},25,25" ${mask}`;
  await $`convert "${image}" -matte "${mask}" -compose DstIn -composite "${tmp}"`;
  return tmp;
};

const dimensions = async (image) => {
  const { stdout } = await $`identify -format '%wx%h' ${image}`;
  const [width, height] = stdout.trim().split('x');
  return { height, width, raw: stdout.trim() };
};

const screenshadow = async (image, dest) => {
  const { height, width, raw } = await dimensions(image);
  const tmp = await mask(image, height, width, raw);
  await $`/home/kingsley/.config/eww/scripts/utilities/screenshadow ${tmp} ${dest} ${width} ${height}`;
};

const notify = async (image, save) => {
  const location = save ? 'file' : 'clipboard';
  await $`dunstify -i ${image} 'Screenshot saved to ${location}'`;
};

const copy = async (image) => {
  $`wl-copy -t 'image/png' < ${image}`.nothrow();
  $`pkill wl-copy`.nothrow();
};

try {
  // const tmp = await mktemp('temp');
  const dest = await output(argv.save);
  await grim(dest, argv.save);
  // await screenshadow(tmp, dest, size);
  await notify(dest, argv.save);
  await copy(dest);
} catch (e) {
  console.log(e);
}
