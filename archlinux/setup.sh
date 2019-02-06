#!/bin/sh

# systemd units cant be symlinks
echo "Installing systemd unit files"
cp -r systemd ~/.config

sudo cp pacman.conf /etc/pacman.conf
