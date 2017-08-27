zstyle :compinstall filename '/home/endoffile/.zshrc'

export PATH="$PATH:$HOME/bin/:$(ruby -e 'print Gem.user_dir')/bin"

autoload -Uz compinit
compinit

autoload -Uz run-help
autoload -Uz zsh-add-hook

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

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

configs=("aliases.zsh" "completion.zsh" "prompt.zsh" "functions.zsh")

for file in "${configs[@]}"; do
	source "${HOME}/.zsh/${file}"
done

if [[ -f "$HOME/.zsh/private.zsh" ]]; then
	source ~/.zsh/private.zsh
fi

setopt appendhistory
setopt correct
setopt interactivecomments
setopt no_beep

unsetopt autocd
