# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
export LANG=en_US.UTF-8
export EDITOR=vim
export BROWSER=lynx
export GIT_PS1_SHOWDIRTYSTATE=1
export PATH=$HOME/.local/bin:$PATH

export LESSHISTFILE=/dev/null
export HISTSIZE=1000
export HISTTIMEFORMAT="[%Y-%m-%d %T] "
export HISTIGNORE="&:ls:[bf]g:exit:pwd:clear:history:sudo *:su *:shred *:jrnl *:[ \t]*"

# setup starship
if [[ -x $(type -p starship) ]]; then
    eval "$(starship init bash)"
fi

# setup direnv
if [[ -x $(command -v direnv) ]]; then
    eval "$(direnv hook bash)"
fi

# setup pyenv
if [[ -x $(command -v pyenv) ]]; then
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# Setup bat for man page
if [[ -x "$(type -p bat)" ]]; then
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# setup rg in combination with fzf
if [[ -x "$(command -v rg)" ]]; then
    export FZF_DEFAULT_OPTS="--extended --cycle"
    export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
fi

# vim:set ts=4:sw=4:et

