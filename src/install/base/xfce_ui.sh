#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Xfce4 UI components"
apt-get update

apt-get install -y xfce4 xfce4-terminal dbus-x11 xfce4-notifyd xorg libnotify-bin at-spi2-core
apt-get purge -y pm-utils xscreensaver*
apt-get clean -y

rm -rf /var/lib/apt/lists/*
