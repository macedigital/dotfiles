#!/bin/bash
# vim:ft=bash:ts=4:sw=4:et

export PYTHONDONTWRITEBYTECODE=1
export PYTHONUNBUFFERED=1
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonrc
export PYTHON_HISTORY="$XDG_STATE_HOME"/python_history
export PYTHONPYCACHEPREFIX="$XDG_CACHE_HOME"/python
export PYTHONUSERBASE="$XDG_DATA_HOME"/python
export PYTHON_EGG_CACHE="$XDG_CACHE_HOME"/python-eggs
export RUFF_CACHE_DIR="$XDG_CACHE_HOME"/ruff

if [[ -x $(type -p pip) ]]; then
    alias pip_upgrade='pip list -o --user --not-required --format=freeze | cut -d '=' -f1 | xargs pip install -U'
fi
