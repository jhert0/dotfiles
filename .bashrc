[[ $- != *i* ]] && return

if [[ -f "${HOME}/.config/aliases" ]]; then
    source ~/.config/aliases
fi

PS1='[\u@\h \W]\$ '

export HISTCONTROL=ignoreboth

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
