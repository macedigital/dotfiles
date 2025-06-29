#!/bin/bash
# vim:ft=bash:ts=4:sw=4:et

if [[ -x $(type -p zoxide) ]]; then
    eval "$(zoxide init bash)"
fi
