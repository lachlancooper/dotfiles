[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f /usr/local/share/liquidprompt ] && . /usr/local/share/liquidprompt

alias git=hub
alias canhazip="http -b canhazip.com"

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export PROMPT_COMMAND="echo -ne '\033]0;${PWD/#$HOME/~}\007';$PROMPT_COMMAND"
export PS1="\u@\h:\w \$ "
export HISTFILESIZE=
export HISTSIZE=
export HISTCONTROL=ignoredups
export HISTTIMEFORMAT="%F %T "

export GOPATH=$HOME/.go

export PATH=$PATH:$(go env GOPATH)/bin

export GPG_TTY=$(tty)
