# vim:ft=bash:ts=4:sw=4:et

if [[ -x $(type -p nnn) ]]; then
    alias ls="nnn -de"
    alias ncp="cat ${NNN_SEL:-${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.selection} | tr '\0' '\n'"
fi
