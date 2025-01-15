#!/bin/sh

open_link () {
  osascript -e 'tell application "Arc"' \
    -e 'tell front window' \
      -e 'tell space "Work" to focus' \
        -e "tell tab \"$1\" to select" \
      -e 'end tell' \
    -e 'activate' \
  -e 'end tell'
}
