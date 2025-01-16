export PATH=$PATH:/opt/homebrew/bin
# Ensure in tmux
if [ "$TMUX" = "" ]; then tmux; fi
# FS Specific
export SKIP_FS_PS1=1
# Pure prompt
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure
autoload -U colors && colors
# Silence direnv output
export DIRENV_LOG_FORMAT=""
eval "$(direnv hook zsh)"
if [ -f ${HOME}/.fsprofile ]; then
  source ${HOME}/.fsprofile
fi
#Aliases
alias g='git'
alias k='kubectl'
alias kns='kubens'
alias kctx='kubectx'
alias cdfs='cd ${FS_HOME}'
alias cdc='cd ${HOME}/code'
alias cdd='cd ${HOME}/code/dotfiles'
alias ports='sudo lsof -i -P | grep LISTEN'
alias ls='ls --color=auto'
alias ll='ls -la'
alias l.='ls -d .* --color=auto'
alias vim='nvim'
alias vi='nvim'
PATH="$(brew --prefix)/opt/gnu-sed/libexec/gnubin:$PATH"
echo -e "\033]50;SetProfile=under-the-sea-tweaked\a"
if [ -e /usr/local/bin/brew ]; then eval "$(/usr/local/bin/brew shellenv)"; else eval "$(/opt/homebrew/bin/brew shellenv)"; fi

# For zsh files not checked into git
if [ -d "${HOME}/.local" ]; then
for FILE in ${HOME}/.local/*; do
    source $FILE
done
fi
