# vim:ft=bash:ts=4:sw=4:et

# shells
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'

# helpers
if [[ -x $(type -p exa) ]]; then
    alias la='exa -la --group-directories-first'
fi

alias psc='ps xawf -eo pid,user,cgroup,args'
