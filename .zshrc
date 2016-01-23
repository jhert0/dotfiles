zstyle :compinstall filename '/home/endoffile/.zshrc'

export EDITOR="emacsclient -nc -a ''"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig/"
export PATH="$PATH:$HOME/bin/"
export GOPATH="$HOME/go"

autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt appendhistory
unsetopt autocd

alias emacs="emacsclient -nc"
