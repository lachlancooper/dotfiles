[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f /usr/local/share/liquidprompt ] && . /usr/local/share/liquidprompt
[ -f /usr/local/share/chtf/chtf.sh ] && . /usr/local/share/chtf/chtf.sh
complete -C /usr/local/bin/terraform terraform

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
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

export PATH=$PATH:$(go env GOPATH)/bin
