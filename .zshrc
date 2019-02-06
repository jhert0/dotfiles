zstyle :compinstall filename '/home/endoffile/.zshrc'

export PATH="$PATH:$HOME/bin/:$(ruby -e 'print Gem.user_dir')/bin"
export LS_COLORS="di=94;1:ln=96;1:so=95;1:pi=93:ex=32;1:bd=93;1:cd=93;1:tw=30;42:st=30;42:*.png=1;35:*.gif=1;35:*.jpg=1;35:*.webm=1;35:*.mkv=1;35:*.avi=1;35:*.tiff=1;35:*.mp4=1;35:*.mp3=0;36:*.m4a=0;36:*.ogg=0;36:*.opus=0;36:*.wma=0;36"

if [[ -f "/usr/bin/virtualenvwrapper.sh" ]]; then
    source /usr/bin/virtualenvwrapper.sh
fi

autoload -Uz compinit
compinit

autoload -Uz run-help
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

configs=("aliases.zsh" "completion.zsh" "prompt.zsh" "functions.zsh" "private.zsh")

for file in "${configs[@]}"; do
	if [[ -f "${HOME}/.zsh/${file}" ]]; then
	   source "${HOME}/.zsh/${file}"
	fi
done

setopt appendhistory
setopt correct
setopt interactivecomments
setopt no_beep

unsetopt autocd
