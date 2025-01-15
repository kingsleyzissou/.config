#!/bin/sh

MAIL_STATE=$(pgrep -x Mail)
if [ ! $MAIL_STATE ]; then
  exit 0
fi

COUNT=$(osascript -e 'tell application "Mail" to return the unread count of inbox')

case "$SENDER" in
  "mouse.clicked") osascript -e 'tell application "Mail" to activate'
esac

if [ $COUNT -eq 0 ]; then
  sketchybar --set $NAME drawing=off
else
  sketchybar --set $NAME drawing=on label="$COUNT"
fi
