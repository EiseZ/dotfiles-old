#!/bin/bash
selected=$(echo "sleep|shutdown|reboot" | rofi -sep '|' -dmenu -p "power")
export SUDO_ASKPASS="rofi -dmenu -password -i -no-fixed-num-lines -p 'password '"
[[ $selected == "sleep" ]] && echo $(rofi -dmenu -password -i -no-fixed-num-lines -p "password") | sudo -S zzz
[[ $selected == "shutdown" ]] && echo $(rofi -dmenu -password -i -no-fixed-num-lines -p "password") | sudo -S poweroff
[[ $selected == "reboot" ]] && echo $(rofi -dmenu -password -i -no-fixed-num-lines -p "password") | sudo -S reboot
