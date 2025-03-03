import { bind } from 'astal';

import Hyprland from 'gi://AstalHyprland';

const WORKSPACES = [
  { id: 1, icon: '', name: 'browser' },
  { id: 2, icon: '', name: 'code' },
  { id: 3, icon: '', name: 'notes' },
  { id: 4, icon: '', name: 'chat' },
  { id: 5, icon: '', name: 'mail' },
  { id: 6, icon: '', name: 'calendar' },
  { id: 7, icon: '󰲸', name: 'spotify' },
  { id: 8, icon: '', name: 'password' },
];

export const Workspaces = () => {
  const hypr = Hyprland.get_default();

  return (
    <box className="box">
      {bind(hypr, 'workspaces').as((workspaces) =>
        workspaces
          .sort((a, b) => a.id - b.id)
          .map((ws) => {
            const item = WORKSPACES.find((x) => x.id == ws.get_id());
            return (
              <button
                onClick={() => ws.focus()}
                className={bind(hypr, 'focusedWorkspace').as((focused) =>
                  ws.id === focused.id
                    ? `button workspace ${item?.name} active`
                    : `button workspace ${item?.name}`,
                )}
              >
                <label className="icon" label={item?.icon} />
              </button>
            );
          }),
      )}
    </box>
  );
};
