import { bind } from 'astal';

import BatteryService from 'gi://AstalBattery';

export const Battery = () => {
  const battery = BatteryService.get_default();

  return (
    <button className="button">
      {bind(battery, 'percentage').as((percentage) => (
        <box>
          <icon className="icon" icon={bind(battery, 'batteryIconName')} />
          <label className="label" label={`${Math.floor(percentage * 100)}%`} />
        </box>
      ))}
    </button>
  );
};
