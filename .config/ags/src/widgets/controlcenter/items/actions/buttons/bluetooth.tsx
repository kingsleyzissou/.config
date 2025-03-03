import { bind } from 'astal';

import AstalBluetooth from 'gi://AstalBluetooth';

export const Bluetooth = () => {
  const bluetooth = AstalBluetooth.get_default();

  return (
    <box>
      {bind(bluetooth, 'isPowered').as((enabled) => {
        return (
          <button
            className={`action ${enabled ? 'active' : ''}`}
            onClick={() => {
              bluetooth.toggle();
            }}
          >
            <box>
              <icon
                className="icon"
                icon={
                  enabled
                    ? 'bluetooth-active-symbolic'
                    : 'bluetooth-disabled-symbolic'
                }
              />
              <box vertical visible={false}>
                <label
                  className={`subtitle ${enabled ? 'active' : ''}`}
                  label={enabled ? 'Enabled' : 'Disabled'}
                />
              </box>
            </box>
          </button>
        );
      })}
    </box>
  );
};
