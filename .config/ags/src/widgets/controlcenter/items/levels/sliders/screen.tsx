import { bind } from 'astal';

import CustomBrightness from '@services/brightness';

export const ScreenSlider = () => {
  const brightness = CustomBrightness.get_default();

  return (
    <box className="slider">
      <icon icon="display-brightness-symbolic" />
      <slider
        hexpand
        min={0}
        max={1}
        className="brightness"
        value={bind(brightness, 'screen').as(Number)}
        drawValue={false}
        onChangeValue={({ value }) => {
          brightness.screen = value;
        }}
      />
    </box>
  );
};
