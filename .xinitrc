#!/bin/sh

[ -f ~/.xprofile ] && . ~/.xprofile

session=${1:-xfce}

case $session in
    cinnamon ) exec cinnamon-session;;
    xfce     ) exec startxfce4;;
    dwm      ) while :; do
                ssh-agent dwm
               done;;
    *        ) exec $1;;
esac
