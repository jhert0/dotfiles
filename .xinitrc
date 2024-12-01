#!/bin/sh

[ -f ~/.xprofile ] && . ~/.xprofile

session=${1:-cinnamon}

case $session in
    cinnamon ) exec cinnamon-session;;
    bspwm    ) exec bspwm;;
    gnome    ) exec gnome-session;;
    *        ) exec $1;;
esac
