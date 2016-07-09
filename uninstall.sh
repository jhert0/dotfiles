#!/bin/bash

dotfiles=(".tmux.conf" ".zshrc" ".conkyrc" ".bashrc" ".Xresources" ".gitconfig" ".vimrc" ".zshenv" ".xprofile" ".bash_profile")

for file in "${dotfiles[@]}"; do
	if [ -f "$HOME/$file" ]; then
		echo "Removing ${HOME}/${file}"
		rm "$HOME/$file"
	fi
done

directories=(".mpd" ".ncmpcpp" "bin" ".zsh")

for directory in "${directories[@]}"; do
	if [ -d "$HOME/$directory" ]; then
		echo "Removing ${HOME}/${directory}"
		rm -r "${HOME:?}/${directory}"
	fi
done
