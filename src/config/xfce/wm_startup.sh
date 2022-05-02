#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo -e "\n------------------ startup of Xfce4 window manager ------------------"

xfce4-session > $HOME/wm.log &

sleep 1

# Set icon theme, since the default (Adwaita) is not installed
xfconf-query -c xsettings -p /Net/IconThemeName -s Humanity-Dark

cat $HOME/wm.log
