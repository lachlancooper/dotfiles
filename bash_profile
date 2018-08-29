[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f /usr/local/share/liquidprompt ] && . /usr/local/share/liquidprompt

lazynvm() {
  unset -f nvm node npm
  export NVM_DIR=$HOME/.nvm
  [ -s "$(brew --prefix nvm)/nvm.sh" ] && . "$(brew --prefix nvm)/nvm.sh"
}

nvm() {
  lazynvm
  nvm $@
}

node() {
  lazynvm
  node $@
}

npm() {
  lazynvm
  npm $@
}

shopt -s globstar

alias git=hub
alias canhazip="http -b canhazip.com"
alias ag="ag -W 120 --pager=\"less -XFR\""

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export PS1="\u@\h:\w \$ "
export HISTFILESIZE=
export HISTSIZE=
export HISTCONTROL=ignoredups
export HISTTIMEFORMAT="%F %T "

export GOPATH=$HOME/.go

export PATH=$PATH:$(go env GOPATH)/bin
