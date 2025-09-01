#!/bin/bash
# vim:ft=bash:ts=4:sw=4:et

export PYTHONDONTWRITEBYTECODE=1
export PYTHONUNBUFFERED=1
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonrc

if [[ -x $(type -p pip) ]]; then
    alias pip_upgrade='pip list -o --user --not-required --format=freeze | cut -d '=' -f1 | xargs pip install -U'
fi
