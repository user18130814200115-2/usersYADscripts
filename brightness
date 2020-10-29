#!/bin/sh

$brightness = $(cat ~/.cache/brightness)

yad --scale --print-partial --on-top --hide-value --vertical --geometry=500x100-215-40 --fixed --width 10 --height 100 --value=$(cat ~/.cache/brightness) --always-print-result --close-on-unfocus --no-buttons | while read bf; do echo "$bf" > ~/.cache/brightness & echo "$bf/99" | bc -l | while read spo; do xrandr --output HDMI-1 --brightness "$spo" & xrandr --output DP-1 --brightness "$spo"; done done


