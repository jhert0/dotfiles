#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR="emacsclient -nc -a ''"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig/"
export PATH="$PATH:$HOME/bin/"

alias ls='ls --color=auto'
alias emacs="emacsclient -nc"

PS1='[\u@\h \W]\$ '
