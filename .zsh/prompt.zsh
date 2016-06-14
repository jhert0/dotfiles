#!/bin/sh

function virtualenv_info(){
	[[ -n ${VIRTUAL_ENV} ]] || return
	echo "(%B%F{green}${VIRTUAL_ENV:t}%b) "
}

PROMPT='%{$fg_bold[red]%}%(?..%? )%B%F{blue}%n%b%f@%m %B%1~%b %% '
SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '
