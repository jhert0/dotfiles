#!/bin/sh

MOUNTPOINT="/mnt/hdd"
dirs=("media" "data" "docs")

for file in "${dirs[@]}"; do
	echo "Creating symlink ${HOME}/${file}"
	mkdir -p "${MOUNTPOINT}/${file}"
	ln -sf "${MOUNTPOINT}/${file}" "${HOME}/"
done
