import { bind, Variable } from 'astal';
import { Gtk } from 'astal/gtk3';

import AstalMpris from 'gi://AstalMpris';

import { fileExists } from '../../../../utilities';

const CoverArt = ({ art }: { art: string }) => {
  if (!art || !fileExists(art)) {
    return <></>;
  }

  return (
    <box>
      <box
        valign={Gtk.Align.START}
        className="image"
        css={`
          min-height: 120px;
          min-width: 120px;
          background-image: url('${art}');
          background-size: 120px;
          margin-right: 0.5em;
        `}
      />
    </box>
  );
};

type TrackInfoProps = {
  title: string;
  artist: string;
};

const TrackInfo = ({ title, artist }: TrackInfoProps) => {
  return (
    <box className="button track" vertical vexpand>
      <label className="title" label={title} />
      <label className="artist" label={artist} />
    </box>
  );
};

type ProgressProps = {
  position: string;
  length: string;
  progress: number;
};

const Progress = ({ position, length, progress }: ProgressProps) => {
  return (
    <box className="progress">
      <centerbox hexpand>
        <box className="time" halign={Gtk.Align.START}>
          <label label={position} />
        </box>
        <slider
          className="bar"
          heightRequest={2}
          halign={Gtk.Align.CENTER}
          value={progress}
        />
        <box className="time" halign={Gtk.Align.END}>
          <label label={length} />
        </box>
      </centerbox>
    </box>
  );
};

const Controls = ({ spotify }: { spotify: AstalMpris.Player }) => {
  return (
    <box className="controls" halign={Gtk.Align.CENTER} hexpand>
      <button className="control" onClick={() => spotify.shuffle()}>
        {bind(spotify, 'shuffleStatus').as((status) => {
          return (
            <icon
              className={status === AstalMpris.Shuffle.ON ? 'active' : ''}
              icon="media-playlist-shuffle-symbolic"
            />
          );
        })}
      </button>
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
      <button className="control" onClick={() => spotify.loop()}>
        {bind(spotify, 'loopStatus').as((status) => {
          return (
            <icon
              className={
                status === AstalMpris.Loop.TRACK ||
                status === AstalMpris.Loop.PLAYLIST
                  ? 'active'
                  : ''
              }
              icon={
                status === AstalMpris.Loop.TRACK
                  ? 'playlist-repeat-song-symbolic'
                  : status === AstalMpris.Loop.PLAYLIST
                    ? 'arrows-loop-tall-symbolic'
                    : 'arrows-loop-tall-disabled-symbolic'
              }
            />
          );
        })}
      </button>
    </box>
  );
};

const Time = (time: number) => {
  let minutes = Math.floor(time / 60);
  let seconds = Math.floor((time / 60 - minutes) * 60);
  if (seconds < 10) {
    return `${minutes}:0${seconds}`;
  }
  return `${minutes}:${seconds}`;
};

// TODO: add cava!
// TODO: maybe add other players?
export const Media = () => {
  const spotify = AstalMpris.Player.new('spotify');

  const info = Variable.derive([
    bind(spotify, 'available'),
    bind(spotify, 'coverArt'),
    bind(spotify, 'title'),
    bind(spotify, 'artist'),
    bind(spotify, 'position').as(Time),
    bind(spotify, 'length').as(Time),
    Variable.derive(
      [bind(spotify, 'position'), bind(spotify, 'length')],
      (position, length) => position / length,
    ),
  ]);

  return (
    <box onDestroy={() => info.drop()}>
      {info(([available, art, title, artist, position, length, progress]) => {
        if (!available || !art || !title || !artist) {
          return <></>;
        }
        return (
          <box hexpand className="item player" visible={available}>
            <CoverArt art={art} />
            <box vertical>
              <TrackInfo title={title} artist={artist} />
              <Progress
                position={position}
                length={length}
                progress={progress}
              />
              <Controls spotify={spotify} />
            </box>
          </box>
        );
      })}
    </box>
  );
};
