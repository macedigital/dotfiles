# vim:ft=bash:ts=4:sw=4:et

if [[ -x $(type -p direnv) ]]; then
    eval "$(direnv hook bash)"
fi
