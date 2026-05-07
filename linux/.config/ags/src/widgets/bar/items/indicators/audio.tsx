import { bind } from 'astal';

import WirePlumberService from 'gi://AstalWp';

export const Audio = () => {
  const speaker = WirePlumberService.get_default()?.audio.defaultSpeaker!;

  return (
    <button className="button">
      <box>
        <icon className="icon volume" icon={bind(speaker, 'volumeIcon')} />
        <label
          className="label"
          label={bind(speaker, 'volume').as((v) => `${Math.floor(v * 100)}%`)}
        />
      </box>
    </button>
  );
};
