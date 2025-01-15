#!/bin/sh

headphones=(
  icon.color="$MANTLE"
  icon.background.color="$YELLOW"
  label.width=0
  background.color="$TRANSPARENT"
  background.padding_right=14
  script="$PLUGIN_DIR/headphones.sh"
)
sketchybar \
  --add event bluetooth.change "com.apple.bluetooth.status" \
  --add item headphones right \
  --set headphones "${headphones[@]}" \
  --subscribe headphones bluetooth.change mouse.clicked mouse.entered mouse.exited
