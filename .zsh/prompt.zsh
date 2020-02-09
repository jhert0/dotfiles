#!/usr/bin/env zsh

autoload -U colors && colors

setopt promptsubst

virtualenv_info(){
    [[ -n ${VIRTUAL_ENV} ]] || return
    echo "(%B%F{green}${VIRTUAL_ENV:t}%b) "
}

set_prompt(){
    PS1="%F{blue}%B%~%b%f"

    local head=$(git rev-parse --verify HEAD 2>/dev/null)
    if [[ $? -eq 0 ]]; then
        if git rev-parse --is-inside-work-tree 2> /dev/null | grep -q 'true' ; then
            PS1+=" %{$fg_bold[magenta]%}$(git rev-parse --abbrev-ref HEAD)%{$reset_color%}"
            modified=$(git status --short | grep " M " | wc -l)
            if [ $modified -gt 0 ]; then
                PS1+=" %{$fg_bold[green]%}~$modified%{$reset_color%}"
            fi
            untracked=$(git status --short | grep "??" | wc -l)
            if [ $untracked -gt 0 ]; then
                PS1+=" %{$fg_bold[yellow]%}+$untracked%{$reset_color%}"
            fi
            deleted=$(git status --short | grep " D " | wc -l)
            if [ $deleted -gt 0 ]; then
                PS1+=" %{$fg_bold[red]%}-$deleted%{$reset_color%}"
            fi
        fi

    fi
    PS1+=" > "
}

typeset -a precmd_functions
precmd_functions+=set_prompt

SPROMPT="zsh: correct %{$fg_bold[red]%}%R%f%{$reset_color%} to %{$fg_bold[green]%}%r%f%{$reset_color%} [nyae]? "
RPROMPT="%(?..%{$fg_bold[red]%}%?%{$reset_color%})"
