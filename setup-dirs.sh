#!/bin/sh

# this is for creating the directories i use on
# a computer with one hard drive

dirs=("bin" "media" "data" "src" "docs" "tmp" "vms")

for file in "${dirs[@]}"; do
	echo "Creating directory ${HOME}/${file}"
	mkdir -p "${HOME}/${file}"
done
