#!/bin/bash

if [ $2 == 'retro' ]; then
if [ $1 == 'bonsai' ]; then
	cool-retro-term -t Screensaver -e bash -c 'sleep 1 && bonsai -S'
elif [ $1 == 'pipes' ]; then
	cool-retro-term -t Screensaver  -e bash -c 'sleep 1 && pipes.sh -f 60 -r 0 -R'
else
	cool-retro-term -t Screensaver  -e bash -c 'sleep 1 && cmatrix -b -s'
fi
else
if [ $1 == 'bonsai' ]; then
	alacritty -t Screensaver --class Screensaver,Screensaver --config-file /home/eisezimmerman/.config/alacritty/screensaver-bonsai.yml -e bash -c 'sleep 1 && bonsai -S'
elif [ $1 == 'pipes' ]; then
	alacritty -t Screensaver --class Screensaver,Screensaver --config-file /home/eisezimmerman/.config/alacritty/screensaver-bonsai.yml -e bash -c 'sleep 1 && pipes.sh -f 60 -r 0 -R'
else
	alacritty -t Screensaver --class Screensaver,Screensaver --config-file /home/eisezimmerman/.config/alacritty/screensaver-cmatrix.yml -e bash -c 'sleep 1 && cmatrix -b -s'
fi
fi
