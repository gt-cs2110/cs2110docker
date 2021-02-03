#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install circuitsim"
apt-get update && apt-get install -y xserver-xorg-video-dummy

# Ubuntu removed openjfx=8u161-b12-1ubuntu2, so we have to install this directly
# from a .deb now
# OpenJDK + JFX (https://www.azul.com/downloads/zulu-community/)

apt-get install -y java-common libgl1-mesa-glx
wget -P $INST_SCRIPTS/pkgs https://cdn.azul.com/zulu/bin/zulu15.29.15-ca-fx-jdk15.0.2-linux_amd64.deb
dpkg -i $INST_SCRIPTS/pkgs/zulu15.29.15-ca-fx-jdk15.0.2-linux_amd64.deb
rm $INST_SCRIPTS/pkgs/zulu15.29.15-ca-fx-jdk15.0.2-linux_amd64.deb

