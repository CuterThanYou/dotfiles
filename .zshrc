setopt PROMPT_SUBST
PROMPT='%B%F{magenta}%n '$'\U2740'' %f %F{blue}%~%f %F{green}${vcs_info_msg_0_}%f%b%F{blue}'$'\U2771''%f '

# history
HISTFILE=~/.zsh_history
HISTSIZE=9737
SAVEHIST=9737
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
zstyle ':vcs_info:git:*' formats '%b '

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

alias vi="nvim"
alias myconfig="git --git-dir=$HOME/dotfiles --work-tree=$HOME"
