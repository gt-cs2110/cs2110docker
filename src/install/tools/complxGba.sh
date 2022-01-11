#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install complx"
apt-get update
apt-get install -y software-properties-common
add-apt-repository ppa:tricksterguy87/complx
add-apt-repository ppa:tricksterguy87/nin10kit

apt-get update

apt-get install -y complx-tools
apt-get install -y gcc-arm-none-eabi gdb-multiarch

# GBA linker script; random oddities needed in the GBA Makefiles.
dpkg --force-architecture -i $INST_SCRIPTS/pkgs/cs2110-gba-linker-script_1.1.2-0ubuntu1~ppa1~bionic1_amd64.deb
rm $INST_SCRIPTS/pkgs/cs2110-gba-linker-script_1.1.2-0ubuntu1~ppa1~bionic1_amd64.deb

# MGBA emulator
# Unfortunately apt-get install mgba-qt will get you a very outdated version
# the deb packages are released directly on github
if [[ $(dpkg --print-architecture) == "arm64" ]]; then
    # No package for ARM so I had to build from source
    # TODO: find a better solution

    # Install dependencies
    apt-get install -y libsdl2-2.0-0 libopengl0 libqt5widgets5 libqt5core5a libqt5gui5 libqt5multimedia5 libqt5opengl5 libzip5
    
    # Extract tarball with binaries
    tar -zxvf $INST_SCRIPTS/pkgs/mgba_arm64.tar.gz -C /usr
else
    apt-get install -y $INST_SCRIPTS/pkgs/libmgba_0.9.3-focal.deb
    apt-get install -y $INST_SCRIPTS/pkgs/mgba-qt_0.9.3-focal.deb
fi
rm $INST_SCRIPTS/pkgs/libmgba_0.9.3-focal.deb
rm $INST_SCRIPTS/pkgs/mgba-qt_0.9.3-focal.deb
rm $INST_SCRIPTS/pkgs/mgba_arm64.tar.gz

# Necessary config to get mgba to not run super fast, custom button keymapping, and other niceties.
mkdir -p $HOME/.config/mgba
cp $INST_SCRIPTS/configs/mgba-config.ini $HOME/.config/mgba/config.ini

