#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export LANG=en_US.UTF-8
export EDITOR=vim
export GIT_PS1_SHOWDIRTYSTATE=1
export PATH=$HOME/.local/bin:$PATH

export HISTSIZE=1000
export HISTTIMEFORMAT="[%Y-%m-%d %T] "
export HISTIGNORE="&:ls:[bf]g:exit:pwd:clear:history:sudo *:su *:shred *:pacman *:jrnl *:[ \t]*"

# vim:set ts=4:sw=4:et

