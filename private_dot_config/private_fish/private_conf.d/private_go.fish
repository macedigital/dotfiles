# setup go environment
if type -q go
    set -gx GOMODCACHE $XDG_CACHE_HOME/go/pkg/mod
    set -gx GOPATH $HOME/.local/share/go

    if type -q fish_add_path
        fish_add_path ~/.local/share/go/bin
    else
        contains $HOME/.local/share/go/bin $fish_user_paths; or set -Ua fish_user_paths $HOME/.local/share/go/bin
    end
end
