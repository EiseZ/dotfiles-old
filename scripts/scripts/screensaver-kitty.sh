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
	kitty -T=Screensaver --class=Screensaver -o background_opacity=100 -e bash -c 'sleep 1 && cbonsai -S'
elif [ $1 == 'pipes' ]; then
	kitty -T=Screensaver --class=Screensaver -o background_opacity=100 -e bash -c 'sleep 1 && pipes.sh -f 60 -r 0 -R'
else
	kitty -T=Screensaver --class=Screensaver -o background_opacity=100 -e bash -c 'sleep 1 && cmatrix -b -s'
fi
fi
