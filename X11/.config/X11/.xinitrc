#!/bin/bash

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

### Custom ###
# Swap esc and capslock for vim
setxkbmap -option caps:swapescape

# Disable key repeat
xset r off

# Disable mouse acceleration
xinput --set-prop 10 'libinput Accel Profile Enabled' 0, 1
xinput --set-prop 11 'libinput Accel Profile Enabled' 0, 1

# (Hopefully) fix keyboard glitch
xinput float 9
xinput float 16

# Remove not used mouse's
xinput float 11
xinput float 12
xinput float 13
xinput float 17

exec dbus-run-session bspwm
