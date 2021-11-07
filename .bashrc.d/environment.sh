# vim:ft=bash:ts=4:sw=4:et

# misc
export BROWSER=lynx
export GIT_PS1_SHOWDIRTYSTATE=1
export GPG_TTY=$(tty)
export HISTCONTROL=ignoreboth
export HISTFILESIZE=2000
export HISTIGNORE="&:ls:[bf]g:exit:pwd:clear:history:sudo *:su *:shred *:jrnl *:[ \t]*"
export HISTSIZE=1000
export HISTTIMEFORMAT="[%Y-%m-%d %T] "
export LESSHISTFILE=/dev/null
export XDG_CONFIG_HOME="${HOME}/.config"

#if [[ -x "$(type -p bat)" ]]; then
#    export MANPAGER="sh -c 'box -col | bat -l man -p'"
#fi

if [[ -x "$(command -v rg)" ]]; then
    export FZF_DEFAULT_OPTS="--extended --cycle"
    export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
fi
