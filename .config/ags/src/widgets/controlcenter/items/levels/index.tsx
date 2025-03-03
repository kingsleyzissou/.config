import { Variable } from 'astal';

import { VolumeSlider } from './sliders/volume';
import { ScreenSlider } from './sliders/screen';
import { SpeakerSelector } from './selectors/speaker';
import { MicrophoneSelector } from './selectors/microphone';

export const Levels = () => {
  const speakerDropdownVisible = Variable(false);
  const micDropdownVisible = Variable(false);

  return (
    <box className="item">
      <box vertical>
        <ScreenSlider />
        <VolumeSlider type="speaker" dropdownVisible={speakerDropdownVisible} />
        <SpeakerSelector dropdownVisible={speakerDropdownVisible} />
        <VolumeSlider type="microphone" dropdownVisible={micDropdownVisible} />
        <MicrophoneSelector dropdownVisible={micDropdownVisible} />
      </box>
    </box>
  );
};
