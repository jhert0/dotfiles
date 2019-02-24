#!/usr/bin/env bash

dotfiles=(".tmux.conf" ".zshrc" ".conkyrc" ".bashrc" ".mpd" ".ncmpcpp" ".Xresources" ".gitconfig" "bin" ".zsh" ".xprofile" ".bash_profile" ".pylintrc" ".gitignore_global" ".Xresources.d" ".xinitrc" ".profile" ".zprofile")
configs=("user-dirs.dirs" "polybar" "rofi" "compton.conf" "dunst" "qutebrowser" "bspwm" "sxhkd")
PWD=$(pwd)
backup="$HOME/old_dotfiles"

configure_zsh(){
	echo "Configuring zsh..."

	if [ "$SHELL" != "/bin/zsh" ]; then
		chsh -s "$(which zsh)"
	fi

	if [ ! -d "$HOME/.zplug" ]; then
		echo "Installing zplug..."
		git clone https://github.com/zplug/zplug "$HOME/.zplug"
	fi
}

configure_tmux(){
    plugins_dir="$HOME/.tmux/plugins"
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
		git clone https://github.com/endoffile78/dotneovim ~/.config/nvim/
		curl -fLo ~/.config/nvim/autoload/plug.vim --create-dir https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi
}

configure_vim(){
    echo "Configuring vim..."
	if [[ ! -d "$HOME/.vim" && -d "$HOME/.vimrc" ]]; then
        ln -s ~/.config/nvim/ ~/.vim
        ln -s ~/.config/nvim/init.vim ~/.vimrc
	fi
}

backup(){
	mkdir -p "$backup"
	mkdir -p "$backup/.config"
	for file in "${dotfiles[@]}"; do
		if [[ -f "$HOME/$file" || -d "$HOME/$file" ]]; then
			echo "Backing up ${HOME}/${file}"
			mv "$HOME/$file" "$backup/$file"
		fi
	done
	for file in "${configs[@]}"; do
		if [[ -f "$HOME/.config/$file" || -d "$HOME/.config/$file" ]]; then
			echo "Backing up ${HOME}/.config/${file}"
			mv "$HOME/.config/$file" "$backup/.config/$file"
		fi
	done
}

backup
configure_zsh
configure_tmux
configure_emacs
configure_nvim
configure_vim

for file in "${dotfiles[@]}"; do
	echo "Creating symlink ${HOME}/${file}"
	ln -sf "${PWD}/${file}" "${HOME}/${file}"
done

for file in "${configs[@]}"; do
	echo "Creating symlink ${HOME}/.config/${file}"
	ln -sf "${PWD}/.config/${file}" "${HOME}/.config/${file}"
done
