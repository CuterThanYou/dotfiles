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

# home clean up export
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup" 
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"

# other export
export QT_QPA_PLATFORMTHEME="gtk2" # qt to use gtk2
