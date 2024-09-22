eval $(/opt/homebrew/bin/brew shellenv)

# Ensure in tmux
if [ "$TMUX" = "" ]; then tmux; fi

# FS Specific
export SKIP_FS_PS1=1

# Pure prompt
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure
autoload -U colors && colors

# Kubernetes Context Helper
source ~/.zsh/plugins/kubernetes-context.bash

# Silence direnv output
export DIRENV_LOG_FORMAT=""
eval "$(direnv hook zsh)"
source /Users/andrewkonkol/.fsprofile

#Aliases
alias g='git'
alias k='kubectl'
alias kns='kubens'
alias kctx='kubectx'
alias cdfs='cd ${FS_HOME}'
alias ports='sudo lsof -i -P | grep LISTEN'
alias ls='ls --color=auto'
alias ll='ls -la'
alias l.='ls -d .* --color=auto'

PATH="$(brew --prefix)/opt/gnu-sed/libexec/gnubin:$PATH"
RPROMPT="%F{yellow}"$(kubernetes-context)

echo -e "\033]50;SetProfile=under-the-sea-tweaked\a"
