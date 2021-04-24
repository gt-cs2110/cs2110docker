#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install complx"
apt-get update
apt-get install -y software-properties-common
add-apt-repository ppa:tricksterguy87/complx
add-apt-repository ppa:tricksterguy87/nin10kit

apt-get update

apt-get install -y complx-tools nin10kit
apt-get install -y gcc-arm-none-eabi gdb-multiarch

# GBA linker script random oddities needed in the GBA Makefiles.
dpkg -i $INST_SCRIPTS/pkgs/cs2110-gba-linker-script_1.1.2-0ubuntu1~ppa1~bionic1_amd64.deb
rm $INST_SCRIPTS/pkgs/cs2110-gba-linker-script_1.1.2-0ubuntu1~ppa1~bionic1_amd64.deb

# MGBA emulator
# Unfortunately apt-get install mgba-qt will get you a very outdated version
# the deb packages are released directly on github
apt-get install $INST_SCRIPTS/pkgs/libmgba_0.9.1-focal.deb
apt-get install $INST_SCRIPTS/pkgs/mgba-qt_0.9.1-focal.deb

# Necessary config to get mgba to not run super fast, custom button keymapping, and other niceties.
cp $INST_SCRIPTS/configs/mgba-config.ini $HOME/.config/mgba/config.ini


# PDF viewer for documentation.
apt-get install -y evince

