import { bind } from 'astal';

import BluetoothService from 'gi://AstalBluetooth';

export const Bluetooth = () => {
  const bluetooth = BluetoothService.get_default();
  const enabled = bind(bluetooth, 'isPowered');

  return (
    <box>
      <button>
        <label className="icon bluetooth" label={enabled ? '󰂯' : '󰂲'} />
      </button>
    </box>
  );
};
