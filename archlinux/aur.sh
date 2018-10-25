#!/bin/sh

install_aur_package(){
    package=$1
    wget "https://aur.archlinux.org/cgit/aur.git/snapshot/$package.tar.gz"
    tar xvf "$package.tar.gz"
    rm "$package.tar.gz"
    cd "$package"
    makepkg -si
    cd ..
    rm -r "$package"
}

sudo pacman -S --needed wget

install_aur_package "package-query"
install_aur_package "yaourt"

yaourt -S xfce-theme-greybird ttf-monaco
