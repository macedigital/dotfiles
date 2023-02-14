# vim:ft=bash:ts=4:sw=4:et

if [[ -x $(type -p starship) ]]; then
    eval "$(starship init bash)"
    eval "$(starship completions bash)"
fi
