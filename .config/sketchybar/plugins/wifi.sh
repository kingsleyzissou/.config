#!/bin/sh

INFO="$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F ' SSID: '  '/ SSID: / {print $2}')"

ICON="􀙈"
if [ ! $INFO = "" ]; then
  ICON="􀙇"
fi

sketchybar --set "$NAME" icon="$ICON" label="$INFO"

source "$CONFIG_DIR/plugins/helpers/labels.sh"
source "$CONFIG_DIR/plugins/helpers/settings.sh"

case "$SENDER" in
  "mouse.clicked") open_settings "wifi-settings-extension"
esac
