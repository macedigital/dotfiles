# ~/.bashrc
#
# vim:ts=4:sw=4:et:ft=bash

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Make new files unreadable by anyone other than the owner
umask 0077

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*.sh; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi

unset rc

