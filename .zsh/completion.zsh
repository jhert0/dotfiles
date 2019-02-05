#!/usr/bin/env zsh

setopt completeinword

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
if [[ "${terminfo[kcuu1]}" != "" ]]; then
    bindkey "$terminfo[kcuu1]" history-substring-search-up
fi

if [[ "${terminfo[kcud1]}" != "" ]]; then
    bindkey "$terminfo[kcud1]" history-substring-search-down
fi

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

zstyle ':completion:*' menu select
zstyle -e ':completion:*:default' list-colors 'reply=("${LS_COLORS}")'
zstyle ':completion:*' rehash true
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'
zstyle ':completion:*:kill:*' command 'ps -u $USER -wo pid,cmd,%cpu,%mem'
