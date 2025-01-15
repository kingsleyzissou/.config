#!/bin/sh

time=(
  update_freq=10
  label.color="$MANTLE"
  background.color="$TRANSPARENT"
  script="$PLUGIN_DIR/time.sh"
)
sketchybar \
  --add item time center \
  --set time "${time[@]}" \
  --subscribe time mouse.entered mouse.exited
