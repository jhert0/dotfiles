#!/bin/bash

dotfiles=(".tmux.conf" ".zshrc" ".conkyrc" ".bashrc" ".mpd" ".ncmpcpp" ".Xresources" ".gitconfig" "bin" ".zsh" ".zshenv" ".xprofile" ".bash_profile" ".pylintrc")
PWD=$(pwd)
backup="$HOME/old_dotfiles"
plugins_dir="$HOME/.tmux/plugins"

check(){
	software=("tmux" "emacs" "git" "conky" "zsh" "mpd" "ncmpcpp" "nvim")
	for sw in "${software[@]}"; do
		type "${sw}" > /dev/null 2>&1 ||
			{ install "$sw"; }
	done
}

configure_zsh(){
	echo "Configuring zsh..."

	if [ "$SHELL" != "/bin/zsh" ]; then
		chsh -s "$(which zsh)"
	fi

	if [ ! -d "$HOME/.zplug" ]; then
		echo "Installing zplug..."
		curl -sL get.zplug.sh | zsh #if you want to look at the code go to: https://github.com/zplug/installer/blob/master/installer.zsh
	fi
}

configure_tmux(){
	echo "Configuring tmux..."
	if [ ! -d "$plugins_dir" ]; then
		echo "Installing plugins..."
		mkdir -p "$plugins_dir"
		git clone https://github.com/tmux-plugins/tpm "$plugins_dir/tpm"
		git clone https://github.com/tmux-plugins/tmux-battery "$plugins_dir/tmux-battery"
	fi
}

configure_emacs(){
	echo "Configuring emacs..."
	if [ ! -d "$HOME/.emacs.d" ]; then
		echo "Cloning emacs configuration..."
		git clone --recursive https://github.com/endoffile78/dotemacs "$HOME/.emacs.d"
	fi
}

configure_nvim(){
	echo "Configuring neovim..."
	if [[ ! -d "$HOME/.config/nvim" ]]; then
		curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
			 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		git clone https://github.com/endoffile78/dotneovim ~/.config/nvim/
	fi
}

backup(){
	mkdir -p "$backup"
	for file in "${dotfiles[@]}"; do
		if [[ -f "$HOME/$file" || -d "$HOME/$file" ]]; then
			echo "Backing up ${HOME}/${file}"
			mv "$HOME/$file" "$backup/$file"
		fi
	done
}

install(){
	echo "Installing ${1}"
	sudo pacman -Syu "$1"
}

check
backup
configure_zsh
configure_tmux
configure_emacs
configure_nvim

for file in "${dotfiles[@]}"; do
	echo "Creating symlink ${HOME}/${file}"
	ln -sf "$PWD/$file" "$HOME/$file"
done
