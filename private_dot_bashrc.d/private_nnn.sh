# vim:ft=bash:ts=4:sw=4:et

if [[ -x $(type -p nnn) ]]; then
    alias ncp="cat ${NNN_SEL:-${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.selection} | tr '\0' '\n'"

    # provide custom plugin that depends on `mpv` binary
    addtoplaylist=""
    if [[ -x $(type -p mpv) ]]; then
        addtoplaylist="a:addtoplaylist;"
    fi
    export NNN_PLUG="${addtoplaylist}e:-!sudoedit \$nnn;p:preview-tui"
    export NNN_OPTS="acd"
    export NNN_RCLONE="rclone mount --no-checksum"
    export NNN_SSHFS="sshfs -o reconnect,idmap=user,cache_timeout=3600"
    export NNN_TRASH=2 # 1=trash-cli, 2=gio

    unset addtoplaylist
fi
