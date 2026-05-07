import { bind, Variable, Binding } from 'astal';

import WirePlumber from 'gi://AstalWp';

type MicrophoneProps = {
  microphone: WirePlumber.Endpoint;
  isDefault: Binding<Boolean>;
  onClick: any;
};

const Microphone = ({ microphone, isDefault, onClick }: MicrophoneProps) => {
  const label =
    microphone.description.length <= 50
      ? microphone.description
      : microphone.description.slice(0, 50) + '...';

  return (
    <button className="selector-item" onClick={onClick}>
      <box>
        <icon
          className="icon"
          icon={bind(isDefault).as((d) => (d ? 'success-small-symbolic' : ''))}
        />
        <label label={label} tooltipText={microphone.description} truncate />
      </box>
    </button>
  );
};

type MicrophoneSelectorProps = {
  dropdownVisible: Variable<Boolean>;
};

export const MicrophoneSelector = ({
  dropdownVisible,
}: MicrophoneSelectorProps) => {
  const audio = WirePlumber.get_default()?.audio!;
  // this is needed since the speaker.isDefault
  // doesn't seem to be reactive
  const defaultMicrophone = Variable(audio.defaultMicrophone);

  const onClick = (mic: WirePlumber.Endpoint) => {
    mic.set_is_default(true);
    defaultMicrophone.set(mic);
    dropdownVisible.set(false);
  };

  const initialize = (microphones: WirePlumber.Endpoint[]) => {
    // initialize the default speaker, otherwise
    // it is set to null
    microphones.forEach((m) => {
      if (m.isDefault) {
        defaultMicrophone.set(m);
      }
    });
  };

  return (
    <box className={dropdownVisible((v) => (v ? 'selector' : ''))} vertical>
      <revealer reveal_child={bind(dropdownVisible).as(Boolean)}>
        <box vertical>
          {bind(audio!, 'microphones').as((microphones) => {
            initialize(microphones);
            return microphones.map((microphone) => (
              <Microphone
                microphone={microphone}
                onClick={() => onClick(microphone)}
                isDefault={bind(defaultMicrophone).as(
                  (s) => s.id === microphone.id,
                )}
              />
            ));
          })}
        </box>
      </revealer>
    </box>
  );
};
