#!/bin/bash

MONITOR="$(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name')"
STATE_FILE="/tmp/volume-cycle-state"

current="$(cat "$STATE_FILE" 2>/dev/null || echo "34")"

case "$current" in
    "100")
        swayosd-client --monitor "$MONITOR" --output-volume -66
        echo "34" > "$STATE_FILE"
        ;;
    "34")
        swayosd-client --monitor "$MONITOR" --output-volume +38
        echo "72" > "$STATE_FILE"
        ;;
    "72")
        swayosd-client --monitor "$MONITOR" --output-volume +28
        echo "100" > "$STATE_FILE"
        ;;
    *)
        # swayosd-client --monitor "$MONITOR" --output-volume 33
        echo "34" > "$STATE_FILE"
        ;;
esac
