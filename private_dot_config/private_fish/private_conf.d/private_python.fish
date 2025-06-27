set -gx PYTHONDONTWRITEBYTECODE 1

if status is-interactive
    set -gx PYTHONSTARTUP $XDG_CONFIG_HOME/python/pythonrc

    # prefer uv over pyenv
    if command -q uv
        # no additional neeeded
    else if -p $XDG_DATA_HOME/pyenv/bin/pyenv
        # setup pyenv
        set -Ux PYENV_ROOT $XDG_DATA_HOME/pyenv
        set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths

        pyenv init - | source
        pyenv virtualenv-init - | source
    end
end
