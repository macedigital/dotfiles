#!/bin/sh
set -eu

# reload custom waybar widget
pkill -SIGRTMIN+8 waybar
