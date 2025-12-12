#!/bin/sh
xrandr --output HDMI-1 --left-of eDP-1 --auto
copyq &
blueman-applet &
nm-applet &
feh --bg-scale ~/Pictures/wallpapers/1.jpg

