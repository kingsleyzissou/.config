#!/bin/sh

date=(
  update_freq=3600
  icon=􀉉
  icon.color="$MANTLE"
  icon.background.color="$BLUE"
  label.width=0
  background.color="$TRANSPARENT"
  background.padding_right=5
  script="$PLUGIN_DIR/date.sh"
)
sketchybar \
  --add item date right \
  --set date "${date[@]}" \
  --subscribe date mouse.entered mouse.exited mouse.clicked
