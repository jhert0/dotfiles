#!/bin/sh

virtualenv_info(){
	[[ -n ${VIRTUAL_ENV} ]] || return
	echo "(%B%F{green}${VIRTUAL_ENV:t}%b) "
}

export PROMPT="%{$fg_bold[red]%}%(?..%? )%B%F{blue}%n%b%f@%m %B%1~%b %% "
export SPROMPT="zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? "
