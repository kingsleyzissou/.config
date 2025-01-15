#!/bin/sh

sketchybar --set "$NAME" label="$(date '+%d/%m/%Y')"

source "$CONFIG_DIR/plugins/helpers/labels.sh"
source "$CONFIG_DIR/plugins/helpers/link.sh"

case "$SENDER" in
  "mouse.clicked") open_link "Calendar"
esac
