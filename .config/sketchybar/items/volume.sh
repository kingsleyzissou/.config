#!/bin/sh

volume=(
  icon.color="$MANTLE"
  icon.background.color="$PEACH"
  label.width=0
  background.color="$TRANSPARENT"
  background.padding_right=14
  script="$PLUGIN_DIR/volume.sh"
)
sketchybar \
  --add item volume right \
  --set volume "${volume[@]}"\
  --subscribe volume volume_change mouse.clicked mouse.entered mouse.exited
