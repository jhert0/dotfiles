export PATH="$PATH:$HOME/bin/:$HOME/go/bin/:$HOME/.cargo/bin/"
export LS_COLORS="di=94;1:ln=96;1:so=95;1:pi=93:ex=32;1:bd=93;1:cd=93;1:tw=30;42:st=30;42:*.png=1;35:*.gif=1;35:*.jpg=1;35:*.webm=1;35:*.mkv=1;35:*.avi=1;35:*.tiff=1;35:*.mp4=1;35:*.mp3=0;36:*.m4a=0;36:*.ogg=0;36:*.opus=0;36:*.wma=0;36"
export GPG_TTY=$(tty)

export EDITOR="nvim"
export BROWSER="firefox"
export TERMINAL="alacritty"

export ASAN_SYMBOLIZER_PATH="/usr/bin/llvm-symbolizer"
export XBPS_DISTDIR="$HOME/.void-packages"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig/:/usr/local/lib64/pkgconfig"

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;38;5;74m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[38;5;246m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[04;38;5;146m'

export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_ROOT=$ANDROID_HOME

export GOPATH=$(go env GOPATH)
export GO11MODULE="auto"

export XDG_DATA_DIRS="/usr/share/:/usr/local/share/:$HOME/.local/share/flatpak/exports/share/"
