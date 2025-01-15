#!/bin/sh

open_settings () {
  osascript -e 'tell application "System Settings"' \
    -e "reveal pane id \"com.apple.$1\"" \
    -e 'activate' \
  -e 'end tell'
}
