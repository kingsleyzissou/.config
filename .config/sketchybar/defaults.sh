#!/bin/sh

default=(
  padding_left=5
  padding_right=5
  icon.font="SF Pro:Bold:17.0"
  icon.color="${TEXT}"
  icon.padding_left=10
  icon.padding_right=14
  icon.background.height=30
  label.font="SF Pro:Regular:17.0"
  label.color="${TEXT}"
  label.padding_left=14
  label.padding_right=14
  background.color="$MANTLE"
  background.corner_radius=0
  background.height=30
  background.padding_left=0
  background.padding_right=0
)
sketchybar --default "${default[@]}"
