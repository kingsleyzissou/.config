import { bind } from 'astal';

import NotificationService from 'gi://AstalNotifd';

export const DoNotDisturb = () => {
  const dnd = NotificationService.get_default();

  return (
    <box>
      {bind(dnd, 'dontDisturb').as((enabled) => {
        return (
          <button
            className={`action ${enabled ? 'active' : ''}`}
            onClick={() => {
              dnd.set_dont_disturb(!enabled);
            }}
          >
            <box>
              <icon className="icon" icon="moon-outline-symbolic" />
            </box>
          </button>
        );
      })}
    </box>
  );
};
