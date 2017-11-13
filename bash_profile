alias git=hub

export PS1="\u@\h:\w \$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export PROMPT_COMMAND="echo -ne '\033]0;${USER}@${HOSTNAME%%.*}\007';$PROMPT_COMMAND"
export HISTCONTROL=ignoredups
export HISTTIMEFORMAT="%Y-%m-%d %T "
