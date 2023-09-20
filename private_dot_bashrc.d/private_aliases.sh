#!/bin/bash

# shells
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'

# modern ls replacement - https://github.com/eza-community/eza
if [[ -x $(type -p eza) ]]; then
    alias la='eza -la --group-directories-first'
fi

alias psc='ps xawf -eo pid,user,cgroup,args'

# vim:ft=bash:ts=4:sw=4:et
