#vim:ft=bash:ts=4:sw=4:et

if [[ -x $(type -p minikube) ]]; then
    eval "$(minikube completion bash -)"
    alias mkc="minikube kubectl --"
fi

if [[ -x $(type -p helm) ]]; then
    eval "$(helm completion bash)"
fi
