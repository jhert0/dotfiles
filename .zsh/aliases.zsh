#!/usr/bin/env zsh

unalias run-help

alias emacs="emacsclient -nc"
alias E="SUDO_EDITOR=\"emacsclient -t -a emacs\" sudoedit"
alias e="emacs"
alias ls="ls --color=auto"
alias la="ls -alh"
alias ll="ls -lh"
alias df="df -kTh"
alias help="run-help"
