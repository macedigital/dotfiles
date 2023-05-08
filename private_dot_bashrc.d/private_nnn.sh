# vim:ft=bash:ts=4:sw=4:et

if [[ -x $(type -p nnn) ]]; then
    alias ncp="cat ${NNN_SEL:-${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.selection} | tr '\0' '\n'"

    export NNN_PLUG="${NNN_PLUG};e:-!sudoedit \$nnn"
    export NNN_OPTS="de"
    export NNN_RCLONE="rclone mount --no-checksum"
    export NNN_SSHFS="sshfs -o reconnect,idmap=user,cache_timeout=3600"
    export NNN_TRASH=2 # 1=trash-cli, 2=gio
fi
