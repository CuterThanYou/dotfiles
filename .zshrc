setopt PROMPT_SUBST
PROMPT='%B%F{magenta}%n '$'\U2740'' %f %F{blue}%~%f %F{green}${vcs_info_msg_0_}%f%b%F{blue}'$'\U2771''%f '

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
HISTORY_IGNORE="(ls|ls*| *|)"
setopt hist_ignore_all_dups
setopt hist_ignore_all_dups
setopt inc_append_history # write history immediately

#bindkey -e

# auto complete
autoload -Uz compinit
compinit

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

alias myconfig="git --git-dir=$HOME/dotfiles --work-tree=$HOME"
