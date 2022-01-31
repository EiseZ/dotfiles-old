#!/bin/bash

if [ $# -le 1 ] || [ $# -ge 5 ]; then
    echo "Incorrect usage. Usage: runvm.sh [vmname] [memory] [cpucores] [imagename (optional)]"
    exit 1
fi

# Create disk
if [ $# -eq 4 ]; then
    qemu-system-x86_64 -enable-kvm -drive file="$HOME/documents/virtual-machines/$1/$1.img" -m "$2" -cpu host -smp "$3" -vga virtio -display sdl,gl=on -boot menu=on -cdrom "$4"
else
    qemu-system-x86_64 -enable-kvm -drive file="$HOME/documents/virtual-machines/$1/$1.img" -m "$2" -cpu host -smp "$3" -vga virtio -display sdl,gl=on
fi
