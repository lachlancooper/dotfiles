alias git=hub
alias cat=bat
alias pcra='pre-commit run -a'
alias pcau='pre-commit autoupdate'

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f /usr/local/share/liquidprompt ] && . /usr/local/share/liquidprompt
[ -f /usr/local/share/chtf/chtf.sh ] && . /usr/local/share/chtf/chtf.sh
[ -f ~/work/.bash_profile ] && . ~/work/.bash_profile
complete -C /usr/local/bin/terraform terraform

if [ ! $(command -v kctx) ]; then
    brew unlink kubectx
    version=$(brew info kubectx --json | jq -r '.[].installed[].version')
    ln -sf "/usr/local/Cellar/kubectx/$version/bin/kubectx" /usr/local/bin/kctx
    ln -sf "/usr/local/Cellar/kubectx/$version/etc/bash_completion.d/kubectx" /usr/local/etc/bash_completion.d/kctx
fi

shopt -s globstar

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export PS1="\u@\h:\w \$ "
export HISTFILESIZE=
export HISTSIZE=
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT="%F %T "

export GOPATH=$HOME/.go
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

rg() {
    if [ -t 1 ]; then
        command rg -p "$@" | less -RFX
    else
        command rg "$@"
    fi
}
