#!/usr/bin/env bash
set -e

echo "Install VNC server dependencies"
apt install -y x11-utils xauth libfontenc1 libgl1-mesa-dri libxfont-dev libglu1-mesa x11-xkb-utils

echo "Install VNC server"
 [[ $(dpkg --print-architecture) == "amd64" ]] && ARCH="amd64" || ARCH="arm64"
wget -P $INST_SCRIPTS/pkgs "https://iweb.dl.sourceforge.net/project/tigervnc/stable/1.12.0/ubuntu-20.04LTS/$ARCH/tigervncserver_1.12.0-1ubuntu1_$ARCH.deb"
dpkg -i $INST_SCRIPTS/pkgs/tigervncserver_1.12.0-1ubuntu1_$ARCH.deb
rm $INST_SCRIPTS/pkgs/tigervncserver_1.12.0-1ubuntu1_$ARCH.deb
