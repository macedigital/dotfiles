#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export LANG=en_US.UTF-8
export EDITOR=vim
export GIT_PS1_SHOWDIRTYSTATE=1
export PATH=$HOME/.local/bin:$PATH

export LESSHISTFILE=/dev/null
export HISTSIZE=1000
export HISTTIMEFORMAT="[%Y-%m-%d %T] "
export HISTIGNORE="&:ls:[bf]g:exit:pwd:clear:history:sudo *:su *:shred *:jrnl *:[ \t]*"

if [[ -x $(command -v direnv) ]]; then
    eval "$(direnv hook bash)"
fi

# setup rg in combination with fzf
if [[ -x "$(command -v rg)" ]]; then
    export FZF_DEFAULT_OPTS="--extended --cycle"
    export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
fi

# vim:set ts=4:sw=4:et

