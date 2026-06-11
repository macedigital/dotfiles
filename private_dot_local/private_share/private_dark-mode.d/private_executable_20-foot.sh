#!/bin/sh
set -eu

# initial colorscheme is not dynamic, set up new terminals to use same color
sed -i 's/initial-color-theme=light/initial-color-theme=dark/' "$HOME"/.config/foot/foot.ini

# https://codeberg.org/dnkl/foot/src/branch/master/CHANGELOG.md#1-23-1
# Sending `SIGUSR1` sets theme to dark-mode
pgrep foot | xargs -r kill -s SIGUSR1
