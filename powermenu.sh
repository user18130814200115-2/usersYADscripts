#!/bin/sh

yad --button yad-close  --button='Lock!lock:5'  --button='Logout!document-export:6' --button='Reboot!amarok_playlist_refresh:3' --button yad-ok --fixed -center --title "Powermenu" --text "Shutdown will automatically commence in 60 seconds"  --timeout 60 --buttons-layout=center --timeout-indicator bottom

case $? in
	4)poweroff;;
	70)poweroff;;
	3)reboot;;
	6)swaymsg exit;;
	5)swaylock || pkill -KILL -u $USER;;
esac
