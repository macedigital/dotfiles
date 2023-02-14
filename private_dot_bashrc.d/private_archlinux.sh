# vim:ft=bash:ts=4:sw=4:et

if [[ -x $(type -p pacman) ]]; then
    alias pacman-orphans='pacman -Qtdq'
    alias pacman-leaves='pacman -Qm'
fi
