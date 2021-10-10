# vim:ft=bash:ts=4:sw=4:et

# misc
export BROWSER=lynx
export GIT_PS1_SHOWDIRTYSTATE=1

export LESSHISTFILE=/dev/null
export HISTSIZE=1000
export HISTFILESIZE=2000
export HISTTIMEFORMAT="[%Y-%m-%d %T] "
export HISTCONTROL=ignoreboth
export HISTIGNORE="&:ls:[bf]g:exit:pwd:clear:history:sudo *:su *:shred *:jrnl *:[ \t]*"

#if [[ -x "$(type -p bat)" ]]; then
#    export MANPAGER="sh -c 'box -col | bat -l man -p'"
#fi

if [[ -x "$(command -v rg)" ]]; then
    export FZF_DEFAULT_OPTS="--extended --cycle"
    export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
fi


