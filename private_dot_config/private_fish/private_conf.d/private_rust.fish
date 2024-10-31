# setup rust environment
set -gx CARGO_HOME $XDG_DATA_HOME/cargo
set -gx RUSTUP_HOME $XDG_DATA_HOME/rustup 

if type -q cargo
    if type -q fish_add_path
        fish_add_path $CARGO_HOME/bin
    else
        contains $CARGO_HOME/bin $fish_user_paths; or set -Ua fish_user_paths $CARGO_HOME/bin
    end
end
