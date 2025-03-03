import { bind } from 'astal';

import AstalMpris from 'gi://AstalMpris';
import Hyprland from 'gi://AstalHyprland';

export const Spotify = () => {
  const spotify = AstalMpris.Player.new('spotify');
  const hypr = Hyprland.get_default();

  return (
    <eventbox
      className="box media spotify"
      visible={bind(spotify, 'available').as(Boolean)}
      onClick={() => hypr.get_workspace(7).focus()}
    >
      <box className="button">
        <box className="button track">
          <label
            label={bind(spotify, 'title').as((title) =>
              title.length < 20 ? title : `${title.slice(0, 20)}...`,
            )}
          />
        </box>
        <box className="controls">
          <button className="control" onClick={() => spotify.previous()}>
            <icon icon="media-skip-backward-symbolic" />
          </button>
          <button className="control" onClick={() => spotify.play_pause()}>
            <icon
              icon={bind(spotify, 'playbackStatus').as((status) =>
                status
                  ? 'media-playback-start-symbolic'
                  : 'media-playback-pause-symbolic',
              )}
            />
          </button>
          <button className="control" onClick={() => spotify.next()}>
            <icon icon="media-skip-forward-symbolic" />
          </button>
        </box>
      </box>
    </eventbox>
  );
};
