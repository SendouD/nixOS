#!/usr/bin/env bash

THRESHOLD=15

NOTIFY="/run/current-system/sw/bin/notify-send"
PAPLAY="/run/current-system/sw/bin/paplay"

while true; do
    battery=$(cat /sys/class/power_supply/BAT1/capacity)
    status=$(cat /sys/class/power_supply/BAT1/status)

    if [ "$status" = "Discharging" ] && [ "$battery" -le "$THRESHOLD" ]; then
        $NOTIFY "Low Battery" "Battery is at ${battery}%"
        $PAPLAY /run/current-system/sw/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga
    fi

    sleep 60
done
