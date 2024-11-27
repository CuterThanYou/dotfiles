# xdg default
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# export xdg runtime if not defined already
if [ -z "${XDG_RUNTIME_DIR}" ];
then
	export XDG_RUNTIME_DIR="/tmp/${UID}-runtime-dir/"
	if [ ! -d "${XDG_RUNTIME_DIR}" ]; then
		mkdir "${XDG_RUNTIME_DIR}"
		chmod 0700 "${XDG_RUNTIME_DIR}"
	fi
fi

# move zsh config out of ~
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# user variable
export PATH="$HOME/.local/bin/:$PATH"
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"

export XCURSOR_THEME="Banana"
export QT_STYLE_OVERRIDE=kvantum # catppuccin kvantum theme

export MANPAGER="nvim +Man!" # its so slow but whatever
export SCREENSHOTS_DIR="$HOME/media/screenshots"

# home clean up export
export CARGO_HOME="$XDG_DATA_HOME/cargo"
#export RUSTUP_HOME="$XDG_DATA_HOME/rustup" # can't install on gentoo with this option
export PATH="$PATH:$CARGO_HOME/bin"
export STACK_XDG=1
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export DISTCC_DIR="/tmp/distcc"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export W3M_DIR="$XDG_STATE_HOME/w3m"
## npm
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PATH=$PATH:$XDG_DATA_HOME/npm/bin
## xorg
#export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # no worky

# other export
