# vim:ft=bash:ts=4:sw=4:et

# misc
export BROWSER=lynx
export GIT_PS1_SHOWDIRTYSTATE=1
export GPG_TTY=$(tty)
export HISTCONTROL=ignoreboth
export HISTFILESIZE=2000
export HISTIGNORE="&:ls:[bf]g:exit:pwd:clear:history:sudo *:su *:shred *:jrnl *:[ \t]*"
export HISTSIZE=10000
export HISTTIMEFORMAT="[%Y-%m-%d %T] "
export LESSHISTFILE=/dev/null
export LESSSECURE=1
export XDG_CONFIG_HOME="${HOME}/.config"

# set 'micro' as default editor if executable is available
if [[ -x "$(type -p micro)" ]]; then
    export EDITOR=micro
fi

# color and syntax highlighting for man pages
if [[ -x "$(type -p bat)" ]]; then
    # need to also set option when man already uses ANSI escape sequences
    # see https://github.com/sharkdp/bat/issues/652#issuecomment-529032263
    export MANROFFOPT="-c"
    export MANPAGER="sh -c 'col -bx | bat -pl man'"
fi

if [[ -x "$(command -v rg)" ]]; then
    export FZF_DEFAULT_OPTS="--extended --cycle"
    export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
fi

# setup customizations when running in kitty
if [[ $TERM == "xterm-kitty" ]]; then
    alias icat='kitty +kitten icat'
fi
