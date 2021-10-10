# vim:ft=bash:ts=4:sw=4:et

if [[ -x $(type -p docker) ]]; then
    alias docker-rmi='docker images --filter dangling=true -qa | xargs -r docker rmi'
    alias docker-rm='docker ps -aq --filter status=dead | xargs -r docker rm'
fi
