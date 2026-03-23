#!/usr/bin/env bash

THRESHOLD=79

while true; do
    battery=$(cat /sys/class/power_supply/BAT0/capacity)
    status=$(cat /sys/class/power_supply/BAT0/status)

    if [ "$status" = "Discharging" ] && [ "$battery" -le "$THRESHOLD" ]; then
        notify-send "Low Battery" "Battery is at ${battery}%"
        paplay /run/current-system/sw/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga
    fi

    sleep 60
done
