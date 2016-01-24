#!/bin/bash

dotfiles=(".tmux.conf" ".zshrc" ".conkyrc" ".bashrc")

for file in "${dotfiles[@]}"; do
	echo "Removing ${HOME}/${file}"
	rm $HOME/$file
done
