import { bind } from 'astal';

import AstalNetwork from 'gi://AstalNetwork';

export const Wifi = () => {
  const network = AstalNetwork.get_default();
  const wifi = bind(network, 'wifi');

  return (
    <box>
      {wifi.as((w) => (
        <button
          className={`action ${w.enabled ? 'active' : ''}`}
          onClick={() => {
            exec(['nmcli', 'radio', 'wifi', w.enabled ? 'off' : 'on'])
          }}
        >
          <box>
            <icon
              className="icon"
              icon={
                w.enabled
                  ? 'network-wireless-signal-excellent-symbolic'
                  : 'network-wireless-disabled-symbolic'
              }
            />
            <box vertical visible={false}>
              <label
                className={`subtitle ${w.enabled ? 'active' : ''}`}
                label={w.enabled ? w.ssid : 'Disabled'}
              />
            </box>
          </box>
        </button>
      ))}
    </box>
  );
};
