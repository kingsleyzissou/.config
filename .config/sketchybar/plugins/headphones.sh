#!/bin/sh

source "$CONFIG_DIR/plugins/helpers/devices.sh"

if [ $HEADPHONES_CONNECTED -eq 0 ]; then
  sketchybar --set $NAME drawing=on
  sketchybar --set $NAME icon="􀑈"
fi

if [ $AIRPODS_CONNECTED -eq 0 ]; then
  LEFT=$(echo $AIRPODS | jq -r '.device_batteryLevelLeft')
  RIGHT=$(echo $AIRPODS | jq -r '.device_batteryLevelRight')
  sketchybar --set $NAME drawing=on
  sketchybar --set $NAME icon="􀟥" label="L - $LEFT R - $RIGHT"
fi

source "$CONFIG_DIR/plugins/helpers/labels.sh"
source "$CONFIG_DIR/plugins/helpers/settings.sh"

case "$SENDER" in
  "mouse.clicked") open_settings "BluetoothSettings"
esac
