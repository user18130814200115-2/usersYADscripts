#!/bin/sh

yad --button yad-close --button='Reboot!amarok_playlist_refresh:3' --button yad-ok --fixed -center --title "Powermenu" --text "Shutdown will automatically commence in 60 seconds"  --timeout 60 --buttons-layout=center --timeout-indicator bottom

case $? in
	2)poweroff;;
	70)poweroff;;
	3)reboot;;
esac
