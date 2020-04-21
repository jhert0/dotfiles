#!/usr/bin/env bash

dotfiles=(".tmux.conf" ".zshrc" ".conkyrc" ".bashrc" ".Xresources" ".gitconfig" ".xprofile" ".bash_profile" ".pylintrc" ".gitignore_global" ".xinitrc" ".profile" ".zprofile")

for file in "${dotfiles[@]}"; do
	if [ -f "$HOME/$file" ]; then
		echo "Removing ${HOME}/${file}"
		rm "$HOME/$file"
	fi
done

directories=(".ncmpcpp" "bin" ".zsh" ".Xresources.d")

for directory in "${directories[@]}"; do
	if [ -d "$HOME/$directory" ]; then
		echo "Removing ${HOME}/${directory}"
		rm -r "${HOME:?}/${directory}"
	fi
done
