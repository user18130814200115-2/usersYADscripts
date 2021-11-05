# usersYADscripts
Simple scripts for various actions on linux using YAD (Yet Another Dialogue).
Meant for use with polybar (explains the positions) but not strictly nesecary.

## volume.sh
- amixer
- core utils
  + grep
  + awk


## brightness.sh
- xrandr
- bc
- core utils
  + grep
  + cat
  + echo 

## powermenu.sh
for logout:
- sway
for lockscreen:
- swaylock

## wifimenu.sh
- nmcli
- printf
- (GNU) sed
- notify-send.sh
- sleep
- kill
- killall
- cat

### Optional
I use wlrctl to place the YAD window at a given position because river does not respect yad's `--geometry` setting.
These sections can be remove though.
- river
- wlrctl 

## wifimenu-minimal.sh
Wifimenu, but without the fancy stuff (notifications and river specific stuff)
- nmcli
- printf
- (GNU) sed
- sleep
- kill
- killall
- cat
