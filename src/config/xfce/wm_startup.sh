#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo -e "\n------------------ startup of Xfce4 window manager ------------------"

xfce4-session > $HOME/wm.log &

sleep 1
cat $HOME/wm.log
