#!/usr/bin/env zx

$.verbose = false;

const BUS = 11;

const parse = (str) => {
  return (str.split(' ').filter((s) => {
    return !isNaN(parseInt(s));
  }) || [])[0];
};

const current = (output) => {
  const [current, max] = output
    .split(':')
    .pop()
    .replace(/[^0-9\,]/g, '')
    .split(',');
  return (parse(current) / parse(max)) * 100;
};

const get = async () => {
  const { stdout } = await $`ddcutil getvcp 10 --bus ${BUS}`;
  return current(stdout.trim());
};

const set = async (value) => {
  await $`ddcutil --bus ${BUS} --noverify setvcp 10 ${value}`;
  await update(value);
};

const update = async (value) => {
  await $`eww update brighness=${value}`;
};

if (argv.status) {
  echo(JSON.stringify(await get()));
  process.exit(0);
}

if (argv.set) {
  await set(argv.set);
  process.exit(0);
}

console.log('Usage: brightness.mjs --status | --set <value>');
process.exit(2);
