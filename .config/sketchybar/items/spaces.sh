#!/bin/sh

logo=(
  icon="􀣺"
  icon.color="${TEXT}"
  icon.padding_left=14
  icon.padding_right=17
  label.drawing=off
  background.padding_left=5
  click_script="sketchybar --reload"
)
sketchybar \
  --add item logo left \
  --set logo "${logo[@]}"

sketchybar --add event aerospace_workspace_change
space=(
  space="1"
  icon=""
  icon.padding_left=14
  icon.font="RobotoMono Nerd Font:Bold:17.0"
  label.padding_left=0
  label.padding_right=0
  click_script="aerospace workspace 1"
  script="$PLUGIN_DIR/space.sh 1"
)
sketchybar \
  --add space "space.1" left \
  --subscribe "space.1" aerospace_workspace_change \
  --set "space.1" "${space[@]}"

space=(
  space="2"
  icon=""
  icon.padding_left=14
  icon.font="RobotoMono Nerd Font:Bold:17.0"
  label.padding_left=0
  label.padding_right=0
  click_script="aerospace workspace 2"
  script="$PLUGIN_DIR/space.sh 2"
)
sketchybar \
  --add space "space.2" left \
  --subscribe "space.2" aerospace_workspace_change \
  --set "space.2" "${space[@]}"

space=(
  space="4"
  icon=""
  icon.padding_left=14
  icon.font="RobotoMono Nerd Font:Bold:17.0"
  label.padding_left=0
  label.padding_right=0
  click_script="aerospace workspace 4"
  script="$PLUGIN_DIR/space.sh 4"
)
sketchybar \
  --add space "space.4" left \
  --subscribe "space.4" aerospace_workspace_change \
  --set "space.4" "${space[@]}"

space=(
  space="5"
  icon=""
  icon.padding_left=14
  icon.font="RobotoMono Nerd Font:Bold:17.0"
  label.padding_left=0
  label.padding_right=0
  click_script="aerospace workspace 5"
  script="$PLUGIN_DIR/space.sh 5"
)
sketchybar \
  --add space "space.5" left \
  --subscribe "space.5" aerospace_workspace_change \
  --set "space.5" "${space[@]}"

space=(
  space="7"
  icon=""
  icon.padding_left=14
  icon.font="RobotoMono Nerd Font:Bold:17.0"
  label.padding_left=0
  label.padding_right=0
  click_script="aerospace workspace 7"
  script="$PLUGIN_DIR/space.sh 7"
)
sketchybar \
  --add space "space.7" left \
  --subscribe "space.7" aerospace_workspace_change \
  --set "space.7" "${space[@]}"

space=(
  space="9"
  icon=""
  icon.padding_left=14
  icon.font="RobotoMono Nerd Font:Bold:17.0"
  label.padding_left=0
  label.padding_right=0
  click_script="aerospace workspace 9"
  script="$PLUGIN_DIR/space.sh 9"
)
sketchybar \
  --add space "space.9" left \
  --subscribe "space.9" aerospace_workspace_change \
  --set "space.9" "${space[@]}"

frontapp=(
  icon=􀆊
  icon.color="${SURFACE}"
  icon.background.color="${MAUVE}"
  # icon.drawing=off
  script="$PLUGIN_DIR/front_app.sh"
  background.padding_left=21
)
sketchybar \
  --add item front_app left \
  --set front_app  "${frontapp[@]}"\
  --subscribe front_app front_app_switched
