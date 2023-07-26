#!/bin/sh

path=/sys/class/backlight/nvidia_0

inotifywait -q -m -e close_write $path |
while read -r actual_brightness event; do
  cp $path/actual_brightness /sys/class/backlight/amdgpu_bl0/brightness
done
