#!/bin/sh

source "$CONFIG_DIR/colors.sh"

case "$SENDER" in
  "mouse.entered")
    sketchybar --animate linear 20 --set "$NAME" background.color="$MANTLE" label.width=dynamic
  ;;
  "mouse.exited")
    sketchybar --animate linear 60 --set "$NAME" background.color="$TRANSPARENT" label.width=0
  ;;
esac
