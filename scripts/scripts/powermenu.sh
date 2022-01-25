#!/bin/bash
selected=$(echo -e "sleep\nshutdown\nreboot" | dmenu -p "powermenu ")
export SUDO_ASKPASS="rofi -dmenu -password -i -no-fixed-num-lines -p 'password '"
[[ $selected == "sleep" ]] && echo $(echo | dmenu -i -p "password ") | sudo -S loginctl suspend
[[ $selected == "shutdown" ]] && echo $(echo | dmenu -i -p "password ") | sudo -S poweroff
[[ $selected == "reboot" ]] && echo $(echo | dmenu -i -p "password ") | sudo -S reboot
