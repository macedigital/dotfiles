#!/bin/bash
# vim:ft=bash:ts=4:sw=4:et

# rust environment
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

# ensure `cargo/bin/` is in PATH to be able to run the installed binaries
if ! [[ "$PATH" =~ "$CARGO_HOME/bin:" ]]; then
    export PATH="$CARGO_HOME/bin:$PATH"
fi
