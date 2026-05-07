import { bind } from 'astal';

import BrightnessService from '@services/brightness';

export const Brightness = () => {
  const brightness = BrightnessService.get_default();

  return (
    <button className="button">
      <box>
        <icon className="icon volume" icon="display-brightness-symbolic" />
        <label
          className="label"
          label={bind(brightness, 'screen').as(
            (v) => `${Math.floor(v * 100)}%`,
          )}
        />
      </box>
    </button>
  );
};
