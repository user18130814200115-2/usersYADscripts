#!/bin/sh

yad --scale --print-partial --on-top --hide-value --vertical --geometry=500x100-175-40 --fixed --width 10 --height 100 --value=$(amixer sget Master | grep 'Right:' | awk -F'[][]' '{ print $2 }') --always-print-result --close-on-unfocus --no-buttons | while read spo; do amixer -q set Master "$spo"%; done


