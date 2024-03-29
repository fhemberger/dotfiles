#!/usr/bin/env zsh

if [ "${commands[kubectl]}" ]; then
  kubectl() {
    unfunction "$0"
    source <(kubectl completion zsh)
    $0 "$@"
  }

  alias k='kubectl'
  alias ka='kubectl apply'
  alias kc='kubectl create'
  alias kdel='kubectl delete'
  alias kd='kubectl describe'
  alias ked='kubectl edit'
  alias kex='kubectl exec'
  alias kg='kubectl get'
  alias kga='kubectl get all,csr,cm,ds,hpa,ing,jobs,netpol,pvc,pdb,podtemplates,rc,quota,secrets,sa,statefulsets'
  alias kl='kubectl logs'
  alias kpf='kubectl port-forward'
  alias kpx='kubectl proxy'
  alias kw='watch kubectl get'
  alias kx='kubectx'
  alias kn='kubens'

  function kubectl-get-contexts {
    kubectl config get-contexts
  }

  function kubectl-set-context {
    kubectl config set current-context "$1"
  }

  export KUBECONFIG="${HOME}/.kube/config:$(find "${HOME}/.kube/config.d" -type f  -print0 | tr '\0' ':' | head -c -1)"
fi

