#!/bin/bash
#vim:ft=bash:ts=4:sw=4:et

export KUBECONFIG="$XDG_CONFIG_HOME/kube"
export KUBECACHEDIR="$XDG_CACHE_HOME/kube"

if [[ -x $(type -p minikube) ]]; then
    eval "$(minikube completion bash -)"
    alias mkc="minikube kubectl --"
fi

if [[ -x $(type -p helm) ]]; then
    eval "$(helm completion bash)"
fi
