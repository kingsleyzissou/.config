#!/bin/sh

wifi=(
  icon=􀙈
  icon.color="$MANTLE"
  icon.background.color="$PINK"
  label.width=0
  background.color="$TRANSPARENT"
  background.padding_right=14
  script="$PLUGIN_DIR/wifi.sh"
)
sketchybar \
  --add item wifi right \
  --set wifi "${wifi[@]}" \
  --subscribe wifi wifi_change mouse.clicked mouse.entered mouse.exited
