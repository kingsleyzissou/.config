#!/bin/sh

spotify=(
  drawing=off
  icon.color="$MANTLE"
  icon.background.color="$GREEN"
  background.padding_right=14
  script="$PLUGIN_DIR/spotify.sh"
)
sketchybar \
  --add event song.update com.spotify.client.PlaybackStateChanged \
  --add item spotify right \
  --set spotify "${spotify[@]}" \
  --subscribe spotify song.update mouse.clicked
