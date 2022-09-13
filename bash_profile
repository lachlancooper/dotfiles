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
    version=$(brew info kubectx --json | jq -r '.[].installed[].version' | tail -1)
    ln -sf "/usr/local/Cellar/kubectx/$version/bin/kubectx" /usr/local/bin/kctx
    ln -sf "/usr/local/Cellar/kubectx/$version/etc/bash_completion.d/kubectx" /usr/local/etc/bash_completion.d/kctx
fi

if [ ! $(command -v kspy) ]; then
    brew unlink kubespy
    version=$(brew info kubespy --json | jq -r '.[].installed[].version' | tail -1)
    ln -sf "/usr/local/Cellar/kubespy/$version/bin/kubespy" /usr/local/bin/kspy
fi

shopt -s globstar

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export PS1="\u@\h:\w \$ "
export HISTFILESIZE=
export HISTSIZE=
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT="%F %T "
export DOCKER_SCAN_SUGGEST=false

export GOPATH=$HOME/.go
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

export HOMEBREW_NO_INSTALL_CLEANUP=1

rg() {
    if [ -t 1 ]; then
        command rg -p "$@" | less -RFX
    else
        command rg "$@"
    fi
}

envpod() {
    namespace=$1
    pod=$2

    if [[ $# -ne 2 ]]; then
        echo "usage: $FUNCNAME <namespace> <pod>"
        return 1
    fi

    kubectl exec -n "$namespace" "$pod" -- sh -c 'tr "\0" "\n" < /proc/$(pgrep -P 1)/environ'
}

ssm() {
    environment=$1
    region=$2
    instance=$3

    if [[ $# -ne 3 ]]; then
        echo "usage: $FUNCNAME <environment> <region> <instance-id>"
        return 1
    fi

    AWS_PROFILE="$environment" AWS_REGION="$region" aws ssm start-session --target "$instance" --document-name AWS-StartInteractiveCommand --parameters command="bash -l"
}
