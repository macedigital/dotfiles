#!/bin/bash
# vim:ft=bash:ts=4:sw=4:et

# shells
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'

# modern ls replacement - https://github.com/eza-community/eza
if [[ -x $(type -p eza) ]]; then
    alias la='eza -la --group-directories-first'
fi

# setup customizations when running in kitty
if [[ $TERM == "xterm-kitty" ]]; then
    alias icat="kitty +kitten icat"
fi

alias psc='ps xawf -eo pid,user,cgroup,args'
