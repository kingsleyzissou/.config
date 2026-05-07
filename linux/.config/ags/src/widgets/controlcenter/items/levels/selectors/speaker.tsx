import { bind, Variable, Binding } from 'astal';

import WirePlumber from 'gi://AstalWp';

type SpeakerProps = {
  speaker: WirePlumber.Endpoint;
  isDefault: Binding<Boolean>;
  onClick: any;
};

const Speaker = ({ speaker, isDefault, onClick }: SpeakerProps) => {
  const label =
    speaker.description.length <= 50
      ? speaker.description
      : speaker.description.slice(0, 50) + '...';

  return (
    <button className="selector-item" onClick={onClick}>
      <box>
        <icon
          className="icon"
          icon={bind(isDefault).as((d) => (d ? 'success-small-symbolic' : ''))}
        />
        <label label={label} tooltipText={speaker.description} truncate />
      </box>
    </button>
  );
};

type SpeakerSelectorProps = {
  dropdownVisible: Variable<Boolean>;
};

export const SpeakerSelector = ({ dropdownVisible }: SpeakerSelectorProps) => {
  const audio = WirePlumber.get_default()?.audio!;
  // this is needed since the speaker.isDefault
  // doesn't seem to be reactive
  const defaultSpeaker = Variable(audio.defaultSpeaker);

  const onClick = (speaker: WirePlumber.Endpoint) => {
    speaker.set_is_default(true);
    defaultSpeaker.set(speaker);
    dropdownVisible.set(false);
  };

  const initialize = (speakers: WirePlumber.Endpoint[]) => {
    // initialize the default speaker, otherwise
    // it is set to null
    speakers.forEach((s) => {
      if (s.isDefault) {
        defaultSpeaker.set(s);
      }
    });
  };

  return (
    <box className={dropdownVisible((v) => (v ? 'selector' : ''))} vertical>
      <revealer reveal_child={bind(dropdownVisible).as(Boolean)}>
        <box vertical>
          {bind(audio!, 'speakers').as((speakers) => {
            initialize(speakers);
            return speakers.map((speaker) => (
              <Speaker
                speaker={speaker}
                onClick={() => onClick(speaker)}
                isDefault={bind(defaultSpeaker).as((s) => s.id === speaker.id)}
              />
            ));
          })}
        </box>
      </revealer>
    </box>
  );
};
