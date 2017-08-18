#!/bin/zsh

autoload -U colors && colors

setopt promptsubst

virtualenv_info(){
	[[ -n ${VIRTUAL_ENV} ]] || return
	echo "(%B%F{green}${VIRTUAL_ENV:t}%b) "
}

set_prompt(){
	PS1="%B%F{blue}%n%b%f@%m %B%1~%b"
	if git rev-parse --is-inside-work-tree 2> /dev/null | grep -q 'true' ; then
		PS1+=" %{$fg_bold[blue]%}$(git rev-parse --abbrev-ref HEAD)%{$reset_color%}"
		if [ $(git status --short | wc -l) -gt 0 ]; then
			PS1+=" %{$fg[red]%}+$(git status --short | wc -l | awk '{$1=$1};1')%{$reset_color%}"
		fi
	fi
	PS1+=" %% "
}

typeset -a precmd_functions
precmd_functions+=set_prompt

SPROMPT="zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? "
RPROMPT="%(?..%{$fg_bold[red]%}%?%{$reset_color%})"
