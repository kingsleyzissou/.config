#!/usr/bin/env zx

$.verbose = false;

const contains = (needle, haystack) => {
  return haystack.filter((h) => h.id == needle.id).length > 0;
};

const WORKSPACES = [
  { id: 0, class: 'emtpy', active: false, empty: true },
  { id: 1, class: 'brave', active: false, empty: true },
  { id: 2, class: 'code', active: false, empty: true },
  { id: 3, class: 'terminal', active: false, empty: true },
  { id: 4, class: 'chat', active: false, empty: true },
  { id: 5, class: 'mail', active: false, empty: true },
  { id: 6, class: 'calendar', active: false, empty: true },
  { id: 7, class: 'spotify', active: false, empty: true },
  { id: 8, class: 'op', active: false, empty: true },
];

const workspaces = async (active) => {
  const { stdout } = await $`hyprctl workspaces -j`;
  const spaces = JSON.parse(stdout.trim());
  return {
    active,
    workspaces: WORKSPACES.map((w) => {
      return {
        ...w,
        empty: !contains(w, spaces),
        active: active == w.id,
      };
    }),
  };
};

const emit = async (a, type) => {
  if (type === 'workspace') {
    const spaces = await workspaces(a);
    await $`eww update workspaces=${JSON.stringify(spaces)}`;
    return;
  }
  const w = await window();
  await $`eww update window=${JSON.stringify(w)}`;
};

const window = async () => {
  const { stdout } = await $`hyprctl activewindow -j`;
  return JSON.parse(stdout.trim());
};

const active = async () => {
  const { stdout } = await $`hyprctl monitors -j`;
  const a = JSON.parse(stdout.trim()).find((m) => m.focused);
  return a.activeWorkspace.id;
};

const listen = async (instance) => {
  const {
    stdout,
  } = $`socat -u UNIX-CONNECT:/tmp/hypr/${instance}/.socket2.sock -`;
  for await (let _ of stdout) {
    await emit(await active(), 'workspace');
    await emit(0, 'window');
  }
};

if (argv.status) {
  await emit(await active(), 'workspace');
  await emit(0, window);
  listen(process.env.HYPRLAND_INSTANCE_SIGNATURE);
}

if (argv.active) {
  echo(await active());
}
