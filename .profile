export PATH="$PATH:$HOME/bin/:$HOME/go/bin/:$HOME/.cargo/bin/:$HOME/.local/bin/:$HOME/.yarn/bin/"
export GPG_TTY=$(tty)

export DO_NOT_TRACK=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1

if [[ -d "$HOME/.dotnet" ]]; then
    export DOTNET_ROOT="$HOME/.dotnet"
    export PATH="$PATH:$HOME/.dotnet:$HOME/.dotnet/tools"
fi

export EDITOR="nvim"
export BROWSER="firefox"
export TERMINAL="kitty"

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

export GOPROXY="direct"

if type go &> /dev/null; then
    export GOPATH=$(go env GOPATH)
    export GO11MODULE="auto"
fi

export XDG_DATA_DIRS="/usr/share/:/usr/local/share/:$HOME/.local/share/flatpak/exports/share/:/var/lib/flatpak/exports/share"

export FZF_DEFAULT_OPTS="--layout reverse --preview-window :hidden"

if [[ -f .secrets ]]; then
    . ~/.secrets
fi
