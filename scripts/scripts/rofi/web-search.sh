#!/bin/bash

selected=$(rofi -dmenu -p "search")

[ -z "$selected" ] && sleep 0 || firefox https://google.com/search?q=$selected
