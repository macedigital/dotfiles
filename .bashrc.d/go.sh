# vim:ft=bash:ts=4:sw=4:et

# go environment
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export GOMODCACHE="${XDG_CACHE_HOME:-$HOME/.cache}/go/pkg/mod"
export CGO_ENABLED=0

if ! [[ "$PATH" =~ "$GOPATH/bin:" ]]; then
    export PATH="$GOPATH/bin:$PATH"
fi

