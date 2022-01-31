#!/bin/bash

if [ $# -le 1 ] || [ $# -ge 3 ]; then
    echo "Incorrect usage. Usage: createvm.sh [vmname] [disksize]"
    exit 1
fi

# Create disk
mkdir -p "$HOME/documents/virtual-machines/$1"
cd "$HOME/documents/virtual-machines/$1"
qemu-img create -f qcow2 "$1.img" "$2"
