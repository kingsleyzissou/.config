#!/bin/sh

source "$CONFIG_DIR/colors.sh"

FOCUSED=$(aerospace list-workspaces --focused)

if [ "$1" = "$FOCUSED" ]; then
  sketchybar --set "$NAME" \
    background.color="$TEAL" \
    icon.color="$MANTLE"
else
  sketchybar --set "$NAME" \
    background.color="$MANTLE" \
    icon.color="$TEXT"
fi
