#!/bin/sh

[ -f ~/.xprofile ] && . ~/.xprofile

session=${1:-dwm}

case $session in
    cinnamon ) exec cinnamon-session;;
    dwm      ) while :; do
                ssh-agent dwm
               done;;
    *        ) exec $1;;
esac
