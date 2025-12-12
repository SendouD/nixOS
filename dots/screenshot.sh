#!/usr/bin/env bash

choice=$(printf "copy\nsave" | rofi -dmenu -p "Screenshot:")

case "$choice" in
  copy)
    scrot -s /tmp/screen.png -e 'copyq write image/png - < $f && rm $f'
    ;;
  save)
    scrot -s ~/Pictures/screenshot_%Y-%m-%d-%H%M%S.png -e 'copyq write image/png - < $f && copyq select 0'
    ;;
esac

