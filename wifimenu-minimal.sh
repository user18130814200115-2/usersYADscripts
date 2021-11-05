#!/bin/sh

raw=$(nmcli -g 'IN-USE, SSID, SECURITY, SIGNAL' device wifi list)

oldpid=$(pidof yad)

printf "%s" "$raw" |\
    sed -e 's/ ://' | sed -E "s/\*:([^:]*)/<span color=\'green\'>\1<\/span>/g" | sed\
    -e 's/^/--field=/g'\
    -e 's/:[0-9]$/!signal-100!Connect:BTN/g'\
    -e 's/:[1-2][0-9]$/!signal-25!Connect:BTN/g'\
    -e 's/:[3-4][0-9]$/!signal-50!Connect:BTN/g'\
    -e 's/:[5-6][0-9]$/!signal-75!Connect:BTN/g'\
    -e 's/:[7-9][0-9]$/!signal-100!Connect:BTN/g'\
    -e 's/:100$/!signal-100!Connect:BTN/g'\
    -e 's/.*=:.*$//g'\
    -e 's/:[^!]*!/🔒!/' |\
    sed -E "s/--field=([^🔒]*)(🔒)*(.*)/--field=\"\1 \2\"\3 'printf \"\1\"'/g" |\
    xargs yad --form --undecorated --no-buttons --title="wifi-menu-yad" > /tmp/wifi-menu &

while [ -z $SSID ]; do
    SSID=$(cat /tmp/wifi-menu)
    sleep 0.1
done

newpid=$(pidof yad)
pid=$(printf "$oldpid $newpid" | uniq -u)
[ -z $pid ] && killall yad || kill $pid

password() {
    password=$(yad --undecorated --form --field=""\!password --separator="" --title="wifi-menu-password-yad")
    [ -z $password ] && exit
    nmcli --ask device wifi connect "$SSID" password "$password" ||
	    password
}

[ -z $SSID ] || result=$(nmcli device wifi connect "$SSID")
[ $(printf "$result" | grep -c "Secrets were required, but not provided") -gt 0 ] && password
