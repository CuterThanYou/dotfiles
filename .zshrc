# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/bleh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export EDITOR="nano"
export TERMINAL="alacritty"
export BROWSER="firefox"

PROMPT='%B%F{magenta}%n '$'\U2740'' %f %F{blue}%~%f%b %F{blue}'$'\U2771''%f '

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

alias myconfig="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"
