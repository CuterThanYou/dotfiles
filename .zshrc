HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
HISTORY_IGNORE="(ls|ls*| *|)"

bindkey -e

zstyle :compinstall filename '/home/bleh/.zshrc'
autoload -Uz compinit
compinit

export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"

PROMPT='%B%F{magenta}%n '$'\U2740'' %f %F{blue}%~%f%b %F{blue}'$'\U2771''%f '

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

alias myconfig="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"
alias grep="/usr/bin/grep --color=always"
