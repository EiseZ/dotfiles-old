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
	st -e bash -c 'sleep 1 && cbonsai -S'
elif [ $1 == 'pipes' ]; then
	st -e bash -c 'sleep 1 && pipes.sh -f 60 -r 0 -R'
elif [ $1 == 'qlock' ]; then
	st -e bash -c 'sleep 1 && qlock'
else
	st -e bash -c 'sleep 1 && cmatrix -b -s'
fi
fi
