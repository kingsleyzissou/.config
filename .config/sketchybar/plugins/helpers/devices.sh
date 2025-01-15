#!/bin/sh

AIRPODS_NAME="Gianluca’s AirPods"
HEADPHONES_NAME="WH-1000XM4"

device () {
  system_profiler \
    SPBluetoothDataType -json -detailLevel basic 2> /dev/null \
    | jq -e --arg name "$1" '.SPBluetoothDataType.[0]
        | select(.device_connected != null)
        | .device_connected[]
        | select(has($name))
        | flatten[]'
}

AIRPODS=$(device "$AIRPODS_NAME")
AIRPODS_CONNECTED=$(echo $?)

HEADPHONES=$(device "$HEADPHONES_NAME")
HEADPHONES_CONNECTED=$(echo $?)
