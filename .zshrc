zstyle :compinstall filename '/home/endoffile/.zshrc'

if [[ -f "/usr/bin/virtualenvwrapper.sh" ]]; then
    source /usr/bin/virtualenvwrapper.sh
fi

autoload -Uz compinit
compinit

autoload -Uz zsh-add-hook

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt INC_APPEND_HISTORY

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=$HISTSIZE

source ~/.zplug/init.zsh

zplug "zplug/zplug"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "hlissner/zsh-autopair", defer:2

if ! zplug check --verbose; then
	print "Install [y/n]: "
	if read -q; then
		echo; zplug install
	fi
fi

zplug load

configs=("completion.zsh" "prompt.zsh" "functions.zsh" "private.zsh")

for file in "${configs[@]}"; do
	if [[ -f "${HOME}/.zsh/${file}" ]]; then
	   source "${HOME}/.zsh/${file}"
	fi
done

if [[ -f "${HOME}/.config/aliases" ]]; then
    source ~/.config/aliases
fi

setopt appendhistory
setopt correct
setopt interactivecomments
setopt no_beep

unsetopt autocd

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
