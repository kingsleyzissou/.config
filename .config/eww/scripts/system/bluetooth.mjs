#!/usr/bin/env zx

$.verbose = false;

let powered = async () => {
  const { stdout } = await $`bluetoothctl show | grep 'Powered'`;
  return stdout.includes('yes');
};

if (argv.toggle) {
  const action = (await powered()) ? 'off' : 'on';
  await $`bluetoothctl power ${action} 2>&1 > /dev/null`;
  process.exit(0);
}

console.log('Usage: bluetooth.mjs <toggle>');
process.exit(2);
