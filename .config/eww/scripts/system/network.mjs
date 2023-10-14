#!/usr/bin/env zx

$.verbose = false;

const enabled = async () => {
  const { stdout } = await $`cat /sys/class/net/w*/operstate`;
  return stdout.trim() === 'up';
};

if (argv.toggle) {
  const e = await enabled();
  await $`nmcli radio wifi ${e ? 'off' : 'on'}`;
  process.exit(0);
}

console.log('Usage: wifi.mjs <toggle>');
process.exit(2);
