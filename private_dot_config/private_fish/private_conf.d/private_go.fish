# setup go environment
set -gx GOMODCACHE $XDG_CACHE_HOME/go/pkg/mod
set -gx GOPATH $XDG_DATA_HOME/go

if type -q go
    if type -q fish_add_path
        fish_add_path $GOPATH/bin
    else
        contains $GOPATH/bin $fish_user_paths; or set -Ua fish_user_paths $GOPATH/bin
    end
end
