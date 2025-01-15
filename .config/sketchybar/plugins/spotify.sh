#!/bin/sh


SPOTIFY_STATE=$(pgrep -x Spotify)
if [ ! $SPOTIFY_STATE ]; then
  exit 0
fi

STATUS=$(osascript -e 'tell application "Spotify" to get player state')
TRACK=$(osascript -e 'tell application "Spotify" to get name of current track')
ARTIST=$(osascript -e 'tell application "Spotify" to get artist of current track')
ALBUM=$(osascript -e 'tell application "Spotify" to get album of current track')

play () {
  osascript -e 'tell application "Spotify" to playpause'
}

# TODO: maybe move this to a media controls item
case "$STATUS" in
  "playing")
    ICON="􀊆"
  ;;
  "paused")
    ICON="􀊄"
  ;;
  *)
    ICON="􀊄"
esac

case "$SENDER" in
  "mouse.clicked") play
esac

details=(
  icon="$ICON"
  label="$TRACK - $ARTIST"
  drawing=on
)
sketchybar --set "$NAME" "${details[@]}"
