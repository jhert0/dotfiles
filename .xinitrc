#!/bin/sh

[ -f ~/.xprofile ] && . ~/.xprofile
#[ -f ~/.screenlayout/layout.sh ] && . ~/.screenlayout/layout.sh

session=${1:-cinnamon}

case $session in
    bspwm         ) exec bspwm;;
    cinnamon      ) exec cinnamon-session;;
    *             ) exec $1;;
esac
