set -gx PYTHONDONTWRITEBYTECODE 1

if status is-interactive
    set -gx PYTHONSTARTUP $HOME/.config/python/pythonrc
end
