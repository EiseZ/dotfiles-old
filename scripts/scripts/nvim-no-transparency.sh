#!/bin/sh
killall picom
nvim "$@"
picom --experimental-backends -b &
