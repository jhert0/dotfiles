#!/bin/bash

dotfiles=(".tmux.conf" ".zshrc" ".conkyrc" ".bashrc" ".mpd" ".ncmpcpp" ".Xresources")
PWD=`pwd`
backup="$HOME/old_dotfiles"

check(){
	software=("tmux" "emacs" "git" "conky" "zsh")
	for sw in "${software[@]}"; do
		type ${sw} > /dev/null 2>&1 ||
			{ echo >&2 "ERROR: **${sw}** is not installed! Please install it to continue."; exit 1; }
	done
}

configure_zsh(){
	echo "Configuring zsh..."
	chsh -s `which zsh`
	if [[ `pacman -Qs grml-zsh-config` == "" ]]; then
		echo "Installing grml-zsh-config..."
		sudo pacman -Syu grml-zsh-config
	fi
}

configure_tmux(){
	echo "Configuring tmux.."
	if [ ! -d "$HOME/.tmux/plugins" ]; then
		echo "Installing plugins"
		mkdir -p $HOME/.tmux/plugins
		git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
		git clone https://github.com/tmux-plugins/tmux-battery $HOME/.tmux/plugins/tmux-battery
	fi
}

configure_emacs(){
	echo "Configuring emacs..."
	if [ ! -d "$HOME/.emacs.d" ]; then
		echo "Cloning emacs configuration"
		git clone --recursive https://github.com/endoffile78/dotemacs $HOME/.emacs.d
	fi
}

backup(){
	mkdir -p $backup
	for file in "${dotfiles[@]}"; do
		if [[ -f "$HOME/$file" || -d "$HOME/$file" ]]; then
			echo "Backing up ${HOME}/${file}"
			mv $HOME/$file $backup/$file
		fi
	done
}

check
backup
configure_zsh
configure_tmux
configure_emacs

for file in "${dotfiles[@]}"; do
	echo "Creating symlink ${HOME}/${file}"
	ln -sf $PWD/$file $HOME/$file
done
