export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR=vim
source /usr/local/git/contrib/completion/git-completion.bash
source /usr/local/git/contrib/completion/git-prompt.sh
source ~/.pantsrc
GIT_PS1_SHOWDIRTYSTATE=true
PS1="\u@\h[\W]\[\033[0;34m\]\$(__git_ps1)\\[\033[0m\]$ "

# History hacks
export HISTTIMEFORMAT="%Y-%m-%d %T "
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
HISTIGNORE="hnote*"
# Used to put notes in a history file
function hnote {
    echo "## NOTE [`date`]: $*" >> $HOME/.history/bash_history-`date +%Y%m%d`
    }

# used to keep my history forever
#PROMPT_COMMAND="[ -d $HOME/.history ] || mkdir -p $HOME/.history; echo : [\$(date)] $$ $USER \$OLDPWD\; \$(history 1 | sed -E 's/^[[:space:]]+[0-9]*[[:space:]]+//g') >> $HOME/.history/bash_history-\`date +%Y%m%d\`"

rmd () {
  pandoc $1 | lynx -stdin
}

function hsearch {
 history |  grep "$1"
}

function psg {
  ps aux | grep "$1" | grep -v grep
}

function sg-resolv() {
  while read line; do
    IPADDRESSES="$(grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' <<< "$line")"
    for address in ${IPADDRESSES}; do
      HOSTNAME=$(fgrep ${address} /etc/global_hosts | awk '{print $2}')
      if [[ ! -z "${HOSTNAME}" ]]; then
        line=$(echo "$line" | sed s/${address}/${HOSTNAME}/g)
      fi
    done
    echo "$line"
  done
}

alias begin='grep -A999999999 '
alias gpr='git pull --rebase'
alias gpom='git push origin master'
alias gbs="git for-each-ref --sort=-committerdate refs/heads/ | head -10 | sed 's/refs\/heads\///g'"
alias cdp='cd ~/dev/personal/'
alias chx='chmod +x'
alias diff='colordiff'
alias killdns='sudo killall -HUP mDNSResponder'
alias assh='ssh -i ~/id_amazon -l ubuntu'
alias fssh='ssh -i ~/id_amazon -l fedora'
alias rssh='ssh -i ~/id_rackspace -l root'
alias cssh='ssh -i ~/id_amazon -l centos'
alias spackager='packager --platform=linux '


if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
