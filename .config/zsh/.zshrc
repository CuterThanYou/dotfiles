setopt PROMPT_SUBST
PROMPT='%B%F{magenta}%n '$'\U2740'' %f %F{blue}%~%f ${vcs_info_msg_0_}%b%F{blue}'$'\U2771''%f '

# source alias file if it exists
[ -f "$ZDOTDIR/alias" ] && source "$ZDOTDIR/alias"

# history
HISTFILE="$XDG_CACHE_HOME/zsh_history"
HISTSIZE=97379
SAVEHIST=97379
HISTORY_IGNORE="(ls|ls *| *|)"
setopt hist_ignore_all_dups
setopt inc_append_history # write history immediately

# auto complete
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# version control
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%F{green}%b%f '

# keybinds
bindkey '^R' history-incremental-search-backward
bindkey "^[[H" beginning-of-line # Home key
bindkey "^[[F" end-of-line # End key

bindkey -v # vi mode
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
# 1 = blinking block, 2 = block, 3 = blinking underline _, 4 = underline, 5 = blinking beam |, 6 = beam
zle-keymap-select() {
	if [[ $KEYMAP == vicmd ]]; then
		echo -ne "\e[2 q"
	else
		echo -ne "\e[3 q"
	fi
}
precmd_functions+=(zle-keymap-select)
zle -N zle-keymap-select

# go to last dir on yazi exit, Q to keep the same dir
function yz() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	command rm -f -- "$tmp" # command to ignore alias
}

# git remove timezone
export GIT_AUTHOR_DATE="$(date -u +%F)T00:00:00+0000"
#export GIT_AUTHOR_DATE="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
export GIT_COMMITTER_DATE="$GIT_AUTHOR_DATE"

# need source to be at last
# /usr/share/zsh/plugins/* for arch
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null \
	|| source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null \
	|| source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
