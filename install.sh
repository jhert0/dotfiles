#!/bin/bash

dotfiles=(".tmux.conf" ".zshrc" ".conkyrc" ".bashrc" ".mpd" ".ncmpcpp" ".Xresources" ".gitconfig" "bin" ".zsh" ".vimrc")
PWD=`pwd`
backup="$HOME/old_dotfiles"
plugins_dir="$HOME/.tmux/plugins"

check(){
	software=("tmux" "emacs" "git" "conky" "zsh" "mpd" "ncmpcpp" "vim")
	for sw in "${software[@]}"; do
		type ${sw} > /dev/null 2>&1 ||
			{ install $sw; }
	done
}

configure_zsh(){
	echo "Configuring zsh..."
	chsh -s `which zsh`
	if [ ! -d "$HOME/.zplug" ]; then
		echo "Installing zplug..."
		git clone https://github.com/b4b4r07/zplug $HOME/.zplug
	fi
}

configure_tmux(){
	echo "Configuring tmux..."
	if [ ! -d "$plugins_dir" ]; then
		echo "Installing plugins..."
		mkdir -p $plugins_dir
		git clone https://github.com/tmux-plugins/tpm $plugins_dir/tpm
		git clone https://github.com/tmux-plugins/tmux-battery $plugins_dir/tmux-battery
	fi
}

configure_emacs(){
	echo "Configuring emacs..."
	if [ ! -d "$HOME/.emacs.d" ]; then
		echo "Cloning emacs configuration..."
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

install(){
	echo "Installing ${1}"
	sudo pacman -Syu $1
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
