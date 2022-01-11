#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Xfce4 UI components"
apt-get update

# Install new version of xfwm4 manually to avoid this bug
# https://bugs.launchpad.net/ubuntu/+source/xfwm4/+bug/1860921
[[ $(dpkg --print-architecture) == "amd64" ]] && ARCH="amd64" || ARCH="arm64"
apt-get install -y $INST_SCRIPTS/pkgs/xfwm4_4.14.5-1_$ARCH.deb
rm $INST_SCRIPTS/pkgs/xfwm4_4.14.5-1_*.deb

apt-get install -y supervisor xfce4 xfce4-terminal
apt-get purge -y pm-utils xscreensaver*
apt-get clean -y