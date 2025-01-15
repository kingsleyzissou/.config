#!/bin/sh

github=(
  update_freq=300
  icon=""
  icon.font="RobotoMono Nerd Font:Bold:17.0"
  drawing=off
  icon.color="$TEXT"
  icon.background.color="$MANTLE"
  icon.padding_right=5
  label.color="$TEXT"
  label.padding_left=0
  background.padding_right=14
  script="$PLUGIN_DIR/github.sh"
)
sketchybar \
  --add item github right \
  --set github "${github[@]}" \
  --subscribe github mouse.clicked
