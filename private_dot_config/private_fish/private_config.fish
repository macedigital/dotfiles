# always set private mode
#set -g fish_private_mode private
umask 0077

set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state
# unofficial variable, used by e.g. github.com/bevry/dorothy/
set -gx XDG_BIN_HOME $HOME/.local/bin

if status is-interactive
    # Set up global environment variables for interactive sessions
    set -gx GPG_TTY (tty)
    set -gx LESSHISTFILE /dev/null
    set -gx LESSSECURE 1
    set -gx WGETRC $XDG_CONFIG_HOME/wgetrc
    set -gx TMPDIR $XDG_RUNTIME_DIR

    # Disable text for default greeting function
    # https://fishshell.com/docs/current/cmds/fish_greeting.html
    set -g fish_greeting

    # Ensure that $XDG_BIN_HOME is in PATH
    if test -d $XDG_BIN_HOME
        if type -q fish_add_path
            fish_add_path $XDG_BIN_HOME
        else
            contains $XDG_BIN_HOME $fish_user_paths; or set -Ua fish_user_paths $XDG_BIN_HOME
        end
    end

    # z-tooling uses hardcoded paths
    if test "$DESKTOP_SESSION" != "ubuntu"
        if type -q aws
            set -gx AWS_SHARED_CREDENTIALS_FILE $XDG_CONFIG_HOME/aws/credentials
            set -gx AWS_CONFIG_FILE $XDG_CONFIG_HOME/aws/config
        end
        set -gx KUBECONFIG $XDG_CONFIG_HOME/kube
        set -gx KUBECACHEDIR $XDG_CACHE_HOME/kube
    end

    if type -q lynx
        set -gx BROWSER lynx
    end

    if type -q bat
        # verify `col` is available
        if type -q col
            # need to also set option when man already uses ANSI escape sequences
            # see https://github.com/sharkdp/bat/issues/652#issuecomment-529032263
            set -gx MANROFFOPT "-c"
            set -gx MANPAGER "sh -c 'col -bx | bat -pl man'"
        else
            set -gx MANPAGER "bat -pl man"
        end
    end

    if type -q micro
        set -gx EDITOR micro
    end

    if type -q nnn
        set -gx NNN_OPTS "acd"
        set -gx NNN_PLUG "e:-!sudoedit \$nnn;p:preview-tui"
        set -gx NNN_RCLONE "rclone mount --no-checksum"
        set -gx NNN_SSHFS "sshfs -o reconnect,idmap=user,cache_timeout=3600"
        set -gx NNN_TRASH 2 # n=no,1=trash-cli,2=gio
    end

    if type -q direnv
        direnv hook fish | source
        set -g direnv_fish_mode eval_on_arrow
    end

    if type -q starship
        starship init fish | source
    end

    if type -q eza
        abbr -a la eza -la --group-directories-first
    end

    if type -q zoxide
        zoxide init fish | source
    end

    if type -q docker
        abbr -a docker-rmi docker images --filter dangling=true -qa | xargs -r docker rmi
        abbr -a docker-rm docker ps -aq --filter status=dead | xargs -r docker rm
    end

end

if status is-login
    # Commands to run in login sessions can go here
end
