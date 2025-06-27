#!/bin/sh

mail=(
  update_freq=300
  icon="􀍛"
  drawing=off
  icon.color="$MANTLE"
  icon.background.color="$GREEN"
  icon.padding_right=5
  label.color="$MANTLE"
  label.background.color="$GREEN"
  label.padding_left=2
  background.color="$GREEN"
  background.padding_right=14
  script="$PLUGIN_DIR/mail.sh"
)
sketchybar \
  --add item mail right \
  --set mail "${mail[@]}" \
  --subscribe mail mouse.clicked
