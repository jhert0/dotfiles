#!/bin/sh

[ -f ~/.xprofile ] && . ~/.xprofile

session=${1:-bspwm}

case $session in
    cinnamon ) exec cinnamon-session;;
    xfce     ) exec startxfce4;;
    bspwm    ) exec bspwm;;
    dwm      ) while :; do
                ssh-agent dwm
               done;;
    *        ) exec $1;;
esac
