# xdg default {{{
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
# }}}

# move zsh config out of ~
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# user variables
export PATH="$HOME/.local/bin:$PATH"
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"

export XCURSOR_THEME="Banana" # the greatest cursor theme ever made
export QT_STYLE_OVERRIDE=kvantum # catppuccin kvantum theme

export MANPAGER="nvim +Man!" # its so slow but whatever
export SCREENSHOTS_DIR="$HOME/media/screenshots"

# home clean up {{{
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export DISTCC_DIR="/tmp/distcc"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"

## rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export PATH="$PATH:$CARGO_HOME/bin"
## haskell
export STACK_XDG=1
export GHCUP_USE_XDG_DIRS="cum"
export XDG_BIN_HOME="$XDG_DATA_HOME/ghcup/bin" # this is not actual xdg spec and only used by ghcup
export PATH="$PATH:$XDG_BIN_HOME"
## npm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PATH="$PATH:$XDG_DATA_HOME/npm/bin"
## xorg
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
# }}}

# other export

# vim:foldmethod=marker
