[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f /usr/local/share/liquidprompt ] && . /usr/local/share/liquidprompt
complete -C /usr/local/Cellar/terraform/0.11.8/bin/terraform terraform

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
alias ag="ag -W 120 --pager=\"less -XFR\" --path-to-ignore ~/.agignore"

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export PS1="\u@\h:\w \$ "
export HISTFILESIZE=
export HISTSIZE=
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT="%F %T "

export GOPATH=$HOME/.go
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

export PATH=$PATH:$(go env GOPATH)/bin
