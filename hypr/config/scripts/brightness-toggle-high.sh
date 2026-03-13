#!/bin/bash
 
MONITOR="$(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name')"
STATE_FILE="/tmp/brightness-toggle-high-state"
 
current="$(cat "$STATE_FILE" 2>/dev/null || echo "100")"
 
if [[ "$current" == "100" ]]; then
    swayosd-client --monitor "$MONITOR" --brightness 2
    echo "2" > "$STATE_FILE"
else
    swayosd-client --monitor "$MONITOR" --brightness 100
    echo "100" > "$STATE_FILE"
fi
 
