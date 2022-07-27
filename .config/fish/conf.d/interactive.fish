# setup shell for interactive sessions
if status is-interactive
    set -gx XDG_CONFIG_HOME "$HOME/.config"
    set -gx XDG_DATA_HOME "$HOME/.local/share"
    set -gx XDG_CACHE_HOME "$HOME/.cache"
    set -gx LESSHISTFILE /dev/null
    set -gx GPG_TTY (tty)

    if test -d ~/.local/bin
        if type -q fish_add_path
            fish_add_path ~/.local/bin
        else
            contains "$HOME/.local/bin" $fish_user_paths; or set -Ua fish_user_paths "$HOME/.local/bin"
        end
    end

    if type -q lynx
        set -gx BROWSER lynx
    end

    if type -q bat
        # need to also set option when man already uses ANSI escape sequences
        # see https://github.com/sharkdp/bat/issues/652#issuecomment-529032263
        set -gx MANROFFOPT "-c"
        set -gx MANPAGER "sh -c 'col -bx | bat -pl man'"
    end

    if type -q micro
        set -gx EDITOR micro
    end

    if type -q nnn
        abbr ls nnn

        set -gx NNN_OPTS "de"
        set -gx NNN_BMS "H:~"
        set -gx NNN_PLUG "e:-!sudoedit \$nnn"
        set -gx NNN_RCLONE "rclone mount --no-checksum"
        set -gx NNN_SSHFS "sshfs -o reconnect,idmap=user,cache_timeout=3600"
    end

    if type -q direnv
        direnv hook fish | source
    end

    if type -q starship
        starship init fish | source
    end
end
