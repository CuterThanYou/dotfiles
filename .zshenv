# xdg default
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# move zsh config out of ~
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# user variable
export PATH="$HOME/.local/bin/:$PATH"
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"

export SCREENSHOTS_DIR="$HOME/media/screenshots"

# home clean up export
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup" 
export STACK_XDG=1
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
#export GNUPGHOME="$XDG_DATA_HOME/gnupg"
## npm
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PATH=$PATH:$XDG_DATA_HOME/npm/bin
## xorg
#export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # no worky

# other export
export QT_QPA_PLATFORMTHEME="gtk2" # qt to use gtk2
[ -f "$XDG_DATA_HOME/cargo/env" ] && source "$XDG_DATA_HOME/cargo/env" # cargo to path, not needed on arch
