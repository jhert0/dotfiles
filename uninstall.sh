#!/bin/bash

dotfiles=(".tmux.conf" ".zshrc" ".conkyrc" ".bashrc" ".Xresources" ".gitconfig" ".vimrc")

for file in "${dotfiles[@]}"; do
	echo "Removing ${HOME}/${file}"
	rm $HOME/$file
done

directories=(".mpd" ".ncmpcpp" "bin" ".zsh")

for directory in "${directories[@]}"; do
	echo "Removing ${HOME}/${directory}"
	rm -r $HOME/$directory
done
