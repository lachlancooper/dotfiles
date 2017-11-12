alias git=hub

export PS1="\u@\h:\W \$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export PROMPT_COMMAND="echo -ne '\033]0;${USER}@${HOSTNAME%%.*}\007';$PROMPT_COMMAND"
