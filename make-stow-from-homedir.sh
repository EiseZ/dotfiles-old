#!/bin/sh
mkdir -p "$1"
mv "$HOME/$1" "$1/"
stow $1
