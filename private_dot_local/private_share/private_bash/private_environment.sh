#!/bin/bash
# vim: ts=4 sts=4 sw=4 et ft=bash:

# load AWS config from .config/ folder
if [[ -x "$(type -p aws)" ]]; then
    if [[ "$DESKTOP_SESSION" != "ubuntu" ]]; then
        export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
        export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config
    fi
fi

# set 'lynx' as default browser if executable is available
if [[ -x "$(type -p lynx)" ]]; then
    export LYNX_CFG="$XDG_CONFIG_HOME"/lynx.cfg
    export BROWSER=lynx
fi

# set 'micro' as default editor if executable is available
if [[ -x "$(type -p micro)" ]]; then
    export EDITOR=micro
fi

# color and syntax highlighting for man pages
if [[ -x "$(type -p bat)" && -x "$(type -p col)" ]]; then
    # need to also set option when man already uses ANSI escape sequences
    # see https://github.com/sharkdp/bat/issues/652#issuecomment-529032263
    export MANROFFOPT="-c"
    export MANPAGER="sh -c 'col -bx | bat -pl man'"
fi

# Improved ripgrep integration with fzf
if [[ -x "$(type -p rg)" ]]; then
    export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME"/ripgrep/config
    export FZF_DEFAULT_OPTS="--extended --cycle"
    export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden"
fi
