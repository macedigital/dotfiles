# always set private mode
set -g fish_private_mode private
umask 0077

if status is-interactive
    # Commands to run in interactive sessions can go here

    set -gx TMPDIR "$XDG_RUNTIME_DIR"
    set -gx LESSHISTFILE /dev/null
    set -gx LESSSECURE 1
    set -gx GPG_TTY (tty)
    set -gx PYTHONDONTWRITEBYTECODE 1

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

        set -gx NNN_OPTS "acdr"
        set -gx NNN_PLUG "e:-!sudoedit \$nnn"
        set -gx NNN_RCLONE "rclone mount --no-checksum"
        set -gx NNN_SSHFS "sshfs -o reconnect,idmap=user,cache_timeout=3600"
        set -gx NNN_TRASH n
    end

    if type -q direnv
        direnv hook fish | source
    end

    if type -q starship
        starship init fish | source
    end

    if type -q exa
        abbr -a la exa -la --group-directories-first
    end

    if type -q docker
        abbr -a docker-rmi docker images --filter dangling=true -qa | xargs -r docker rmi
        abbr -a docker-rm docker ps -aq --filter status=dead | xargs -r docker rm
    end

end

if status is-login
    # Commands to run in login sessions can go here
end
