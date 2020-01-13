[[ $- != *i* ]] && return

if [[ -f "${HOME}/.config/aliases" ]]; then
    source ~/.config/aliases
fi

PS1='[\u@\h \W]\$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
