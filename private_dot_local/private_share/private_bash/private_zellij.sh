#!/bin/bash
# vim:ft=bash:ts=4:sw=4:et

if [[ "$TERM" == "foot" && -x $(type -p zellij) ]]; then
    if [[ -z "$ZELLIJ_SESSION_NAME" && "$SHLVL" == "1" && -z "$YAZI_LEVEL" && -z "$NNNLVL" ]]; then
        if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
            zellij attach -c
        else
            zellij
        fi

        if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
            exit
        fi
    fi
fi
