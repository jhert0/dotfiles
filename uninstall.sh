#!/bin/bash

dotfiles=(".tmux.conf" ".zshrc" ".conkyrc" ".bashrc" ".Xresources" ".gitconfig")

for file in "${dotfiles[@]}"; do
	echo "Removing ${HOME}/${file}"
	rm $HOME/$file
done

echo "Removing ${HOME}/.mpd"
rm -r $HOME/.mpd
echo "Removing ${HOME}/.ncmpcpp"
rm -r $HOME/.ncmpcpp
