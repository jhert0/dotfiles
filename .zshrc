zstyle :compinstall filename '/home/endoffile/.zshrc'

export EDITOR="emacsclient -nc -a ''"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig/"
export PATH="$PATH:$HOME/bin/"
export GOPATH="$HOME/go"
#export VIRTUAL_ENV_DISABLE_PROMPT=1
export ENABLE_CORRECTION="true"

autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt appendhistory
unsetopt autocd

source ~/.zplug/zplug

zplug "b4b4r07/zplug"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "plugins/git-prompt",   from:oh-my-zsh, if:"which git"

if ! zplug check --verbose; then
	print "Install [y/n]: "
	if read -q; then
		echo; zplug install
	fi
fi

zplug load

source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/completion.zsh
source $HOME/.zsh/prompt.zsh
