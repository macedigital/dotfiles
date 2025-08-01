#!/bin/sh
set -eu

# https://codeberg.org/dnkl/foot/src/branch/master/CHANGELOG.md#1-23-1
# Sending `SIGUSR1` sets to [color] (aka. light-mode)
pgrep foot | xargs -r kill -s SIGUSR1
