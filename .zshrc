if [ "$TMUX" = "" ]; then tmux; fi
#Aliases
alias g='git'
alias k='kubectl'
alias kns='kubens'
alias kctx='kubectx'
alias ll='ls -l'

# git completion for zsh
autoload -Uz compinit && compinit

source ${HOME}/.git-prompt.sh 
PROMPT="%n@%m[%~]$(__git_ps1)$ "
