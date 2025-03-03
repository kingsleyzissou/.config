import { bind, Variable } from 'astal';

import WirePlumber from 'gi://AstalWp';

const SpeakerSlider = ({ speaker }: { speaker: WirePlumber.Endpoint }) => {
  return (
    <slider
      hexpand
      min={0}
      max={1}
      widthRequest={150}
      value={bind(speaker, 'volume').as(Number)}
      onChangeValue={({ value }) => {
        speaker.volume = value;
      }}
    />
  );
};

const MicSlider = ({ microphone }: { microphone: WirePlumber.Endpoint }) => {
  return (
    <slider
      hexpand
      min={0}
      max={1}
      widthRequest={150}
      value={bind(microphone, 'volume').as(Number)}
      onChangeValue={({ value }) => {
        microphone.volume = value;
      }}
    />
  );
};

type VolumeSliderProps = {
  type: string;
  dropdownVisible: Variable<Boolean>;
};

export const VolumeSlider = ({ type, dropdownVisible }: VolumeSliderProps) => {
  const speaker = WirePlumber.get_default()?.audio.defaultSpeaker!;
  const microphone = WirePlumber.get_default()?.audio.defaultMicrophone!;

  const icon =
    type === 'speaker'
      ? bind(speaker, 'volumeIcon')
      : bind(microphone, 'volumeIcon');

  const Slider = () =>
    type === 'speaker' ? (
      <SpeakerSlider speaker={speaker} />
    ) : (
      <MicSlider microphone={microphone} />
    );

  return (
    <box className="slider">
      <icon icon={icon} />
      <Slider />
      <button onClick={() => dropdownVisible.set(!dropdownVisible.get())}>
        <icon
          icon={dropdownVisible((v) =>
            v ? 'go-up-symbolic' : 'go-down-symbolic',
          )}
        />
      </button>
    </box>
  );
};
