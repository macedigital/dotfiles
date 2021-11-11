# vim:ft=bash:ts=4:sw=4:et

export PYTHONDONTWRITEBYTECODE=1
export PYTHONUNBUFFERED=1

if [[ -x $(type -p pip) ]]; then
    alias pip_upgrade='pip list -o --user --not-required --format=freeze | cut -d '=' -f1 | xargs pip install -U'
fi

if [[ -x $(type -p pyenv) ]]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    if ! [[ "$PATH" =~ "$PYENV_ROOT/bin:" ]]; then
        export PATH="$PYENV_ROOT/bin:$PATH"
    fi
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
