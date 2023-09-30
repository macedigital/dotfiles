# vim:ft=bash:ts=4:sw=4:et

export PYTHONDONTWRITEBYTECODE=1
export PYTHONUNBUFFERED=1
export PYTHONSTARTUP=~/.config/python/pythonrc

if [[ -x $(type -p pip) ]]; then
    alias pip_upgrade='pip list -o --user --not-required --format=freeze | cut -d '=' -f1 | xargs pip install -U'
fi

PYENV_ROOT="${PYENV_ROOT:-$HOME/.local/share/pyenv}"
if [[ -x "${PYENV_ROOT}/bin/pyenv" ]]; then
    export PYENV_ROOT
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    if ! [[ "$PATH" =~ "$PYENV_ROOT/bin:" ]]; then
        export PATH="$PYENV_ROOT/bin:$PATH"
    fi
    # see https://github.com/pyenv/pyenv#advanced-configuration
    eval "$(pyenv init --path)"

    # init for pyenv running in interactive shells
    if [[ $- == *i* ]]; then
        eval "$(pyenv init -)"
        if [[ $(pyenv commands | grep 'virtualenv-init') ]]; then
            eval "$(pyenv virtualenv-init -)"
        fi
    fi
else
    unset PYENV_ROOT
fi
