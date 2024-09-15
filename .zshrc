setopt PROMPT_SUBST
PROMPT='%B%F{magenta}%n '$'\U2740'' %f %F{blue}%~%f ${vcs_info_msg_0_}%b%F{blue}'$'\U2771''%f '

# history
HISTFILE=~/.cache/zsh_history
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

# custom keybind
bindkey "^[[H" beginning-of-line # Home key
bindkey "^[[F" end-of-line # End key

# go to last dir on lf exit
lfcd() { cd "$(command lf -print-last-dir"$@")" }

export PATH="$HOME/.local/bin/:$PATH"
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

alias grep="grep --color=always"
alias ls="ls --color=always"
alias rm="rm -Ivr"
alias mkdir="mkdir -pv"
alias mv="mv -iv"
alias cp="cp -rv"
alias scp="scp -r"
alias df="df -h"
alias du="du -h"

alias yeet="doas pacman -Rns"
alias goodnight="shutdown -h now"

alias lf=lfcd
alias mpv="mpv --terminal=no"
alias mpnv="mpv --terminal=yes --no-video"
alias vi="nvim"
alias myconfig="git --git-dir=$HOME/dotfiles --work-tree=$HOME"
