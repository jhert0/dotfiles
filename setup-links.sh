#!/bin/sh

# I use this for computers with multiple harddrives

MOUNTPOINT="/mnt/hdd"
dirs=("media" "data" "docs" "vms" "tmp")

for file in "${dirs[@]}"; do
	mkdir -p "${MOUNTPOINT}/${file}"
	echo "Creating symlink ${HOME}/${file}"
	ln -sf "${MOUNTPOINT}/${file}" "${HOME}/"
done
