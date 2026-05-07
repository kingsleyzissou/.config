import { bind } from 'astal';

import BatteryService from 'gi://AstalBattery';

export const Battery = () => {
  const battery = BatteryService.get_default();

  return (
    <box className="progress">
      {bind(battery, 'percentage').as((percentage) => (
        <circularprogress
          className="battery"
          startAt={0}
          endAt={1}
          value={percentage}
        >
          <box vertical>
            <icon icon="battery-symbolic" />
            <label
              className="label"
              label={`${Math.floor(percentage * 100)}%`}
            />
          </box>
        </circularprogress>
      ))}
    </box>
  );
};
