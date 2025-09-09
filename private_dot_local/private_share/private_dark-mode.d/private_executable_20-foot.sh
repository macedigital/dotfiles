#!/bin/sh
set -eu

# initial colorscheme is not dynamic, set up new terminals to use same color
sed -i 's/initial-color-theme=1/initial-color-theme=2/' "$HOME"/.config/foot/foot.ini

# https://codeberg.org/dnkl/foot/src/branch/master/CHANGELOG.md#1-23-1
# Sending `SIGUSR2` sets to [color2] (aka. dark-mode)
pgrep foot | xargs -r kill -s SIGUSR2
