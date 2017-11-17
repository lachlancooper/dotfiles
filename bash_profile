[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f /usr/local/share/liquidprompt ] && . /usr/local/share/liquidprompt

alias git=hub

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export PROMPT_COMMAND="echo -ne '\033]0;${USER}@${HOSTNAME%%.*}\007';$PROMPT_COMMAND"
export PS1="\u@\h:\w \$ "
export HISTSIZE=1000000
export HISTCONTROL=ignoredups
export HISTTIMEFORMAT="%F %T "
