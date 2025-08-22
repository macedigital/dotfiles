#!/bin/sh
set -eu

# https://codeberg.org/dnkl/foot/src/branch/master/CHANGELOG.md#1-23-1
# Sending `SIGUSR2` sets to [color2] (aka. dark-mode)
pgrep foot | xargs -r kill -s SIGUSR2

# initial colorscheme is not dynamic, set up new terminals to use same color
sed -i 's/initial-color-theme=1/initial-color-theme=2/' "$XDG_CONFIG_HOME"/foot/foot.ini
