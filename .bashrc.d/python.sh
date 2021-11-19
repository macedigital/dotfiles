# vim:ft=bash:ts=4:sw=4:et

export PYTHONDONTWRITEBYTECODE=1
export PYTHONUNBUFFERED=1

if [[ -x $(type -p pip) ]]; then
    alias pip_upgrade='pip list -o --user --not-required --format=freeze | cut -d '=' -f1 | xargs pip install -U'
fi

PYENV_ROOT="${PYENV_ROOT:-$HOME/.pyenv}"
if [[ -x "${PYENV_ROOT}/bin/pyenv" ]]; then
    export PYENV_ROOT
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    if ! [[ "$PATH" =~ "$PYENV_ROOT/bin:" ]]; then
        export PATH="$PYENV_ROOT/bin:$PATH"
    fi
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    if [[ $(pyenv commands | grep 'virtualenv-init') ]]; then
        eval "$(pyenv virtualenv-init -)"
    fi
else
    unset PYENV_ROOT
fi
