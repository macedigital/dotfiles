#!/bin/sh
set -eu

# https://codeberg.org/dnkl/foot/src/branch/master/CHANGELOG.md#1-23-1
# Sending `SIGUSR2` sets to [color2] (aka. dark-mode)
pgrep foot | xargs -r kill -s SIGUSR2
