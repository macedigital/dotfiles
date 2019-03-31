#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Beautiful shell command line colors
[[ -f "$HOME/.local/bin/shell_prompt.sh" ]] && source "$HOME/.local/bin/shell_prompt.sh"

# Solarized dark LS_COLORS
[[ -f "$HOME/.dircolors" ]] && command -v "dircolors">/dev/null && eval "$(dircolors -b $HOME/.dircolors)"

# Double check window resize
shopt -s checkwinsize

#
# colored man pages
# link https://wiki.archlinux.org/index.php/Man_Page#Colored_man_pages
#
man() {
    env LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}

# vim:set ts=4:sw=4:et

