#!/bin/bash
# vim:ft=bash:ts=4:sw=4:et

if [[ -x $(type -p nnn) ]]; then
    # provide custom plugin that depends on `mpv` binary
    addtoplaylist=""
    if [[ -x $(type -p mpv) ]]; then
        addtoplaylist="a:addtoplaylist;"
    fi
    export NNN_PLUG="${addtoplaylist}e:-!sudoedit \$nnn;p:preview-tui"
    export NNN_OPTS="acd"
    export NNN_RCLONE="rclone mount --no-checksum"
    export NNN_SSHFS="sshfs -o reconnect,idmap=user,cache_timeout=3600"

    # setup soft-delete if available
    if [[ -x $(type -p gio) ]]; then
        export NNN_TRASH=2 # 2=gio
    elif [[ -x $(type -p trash-put) ]]; then
        export NNN_TRASH=1 # 1=trash-cli
    fi

    unset addtoplaylist
fi
