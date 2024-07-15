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

    case $# in
    2)
        echo "Listing instances in $environment $region ..."
        # ssm is quicker but doesn't show instance Name tags
        # AWS_PROFILE="$environment" AWS_REGION="$region" aws ssm get-inventory --filters Key=AWS:InstanceInformation.InstanceStatus,Values=Active | jq -r '.Entities[] | [.Id, .Data["AWS:InstanceInformation"].Content[0].ComputerName] | @tsv'
        AWS_PROFILE="$environment" AWS_REGION="$region" aws ec2 describe-instances --filters Name=instance-state-name,Values=running | jq -r '.Reservations[].Instances[] | [.InstanceId, .PrivateDnsName, (.Tags[]|select(.Key=="Name")|.Value)] | @tsv' | column -s "$(printf '\t')" -t
        ;;
    3)
        AWS_PROFILE="$environment" AWS_REGION="$region" aws ssm start-session --target "$instance" --document-name AWS-StartInteractiveCommand --parameters command="bash -l"
        ;;
    *)
        echo "usage: $FUNCNAME <environment> <region> [<instance-id>]"
        return 1
        ;;
    esac
}

ssmk8s() {
    nodename=$1

    environment=$(kubectl config current-context | cut -d'-' -f4)
    providerid=$(kubectl get nodes "$nodename" -o json | jq -r .spec.providerID)
    region=$(echo "$providerid" | cut -d'/' -f4 | rev | cut -c2- | rev)
    instanceid=$(echo "$providerid" | cut -d'/' -f5)

    ssm "$environment" "$region" "$instanceid"
}

export PATH="$(brew --prefix python@3.11)/libexec/bin:$PATH:${KREW_ROOT:-$HOME/.krew}/bin"
