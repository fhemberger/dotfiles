#!/usr/bin/env zsh
#shellcheck disable=SC2139

if [ "${commands[kubectl]}" ]; then
  kubectl() {
    unfunction "$0"
    source <(kubectl completion zsh)
    $0 "$@"
  }

  executable='kubectl'
  if [ "${commands[kubecolor]}" ]; then
    executable='kubectl'
  fi

  alias k="$executable"
  alias ka="$executable apply"
  alias kc="$executable create"
  alias kdel="$executable delete"
  alias kd="$executable describe"
  alias ked="$executable edit"
  alias kex="$executable exec"
  alias kg="$executable get"
  alias kga="$executable get all,csr,cm,ds,hpa,ing,jobs,netpol,pvc,pdb,podtemplates,rc,quota,secrets,sa,statefulsets"
  alias kl="$executable logs"
  alias klf="$executable logs -f"
  alias kpf="$executable port-forward"
  alias kpx="$executable proxy"
  alias kw="watch $executable get"
  alias kx='kubectx'
  alias kn='kubens'

  function kubectl-get-contexts {
    kubectl config get-contexts
  }

  function kubectl-set-context {
    kubectl config set current-context "$1"
  }

  export KUBECONFIG="${HOME}/.kube/config:$(find "${HOME}/.kube/config.d" \( -name "*.yaml" -o -name "*.yml" \) -print0 | sed 's/\x0$//;s/\x0/:/g')"
fi
