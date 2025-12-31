#!/bin/bash
# vim:ft=bash:ts=4:sw=4:et

if [[ -x $(type -p starship) ]]; then
    export STARSHIP_CONFIG="$XDG_CONFIG_HOME"/starship.toml
    export STARSHIP_CACHE="$XDG_CACHE_HOME"/starship

    eval "$(starship init bash)"
    eval "$(starship completions bash)"
fi
