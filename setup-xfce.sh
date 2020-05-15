#!/bin/sh

xfconf-query -c xsettings -p /Net/ThemeName -s Greybird-dark
xfconf-query -c xsettings -p /Net/IconThemeName -s Numix-Circle

xfconf-query -c xfwm4 -p /general/theme -s Greybird-dark
xfconf-query -c xfwm4 -p /general/move_opacity -s 75

xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-filesystem -s false
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-home -s false
