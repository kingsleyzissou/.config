#!/bin/sh

COUNT="$(gh api notifications | jq 'length')"

if [ "$COUNT" = "0" ]; then
  sketchybar --set $NAME drawing=off
else
  sketchybar --set $NAME drawing=on label="$COUNT"
fi

source "$CONFIG_DIR/plugins/helpers/link.sh"

case "$SENDER" in
  "mouse.clicked") open_link "Notifications"
esac

