#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install complx"
apt-get update
apt-get install -y software-properties-common
add-apt-repository ppa:tricksterguy87/complx
add-apt-repository ppa:tricksterguy87/nin10kit
apt update
apt install -y complx-tools nin10kit
# PDF viewer for documentation.
apt install -y evince
apt install -y gcc-arm-none-eabi gdb-multiarch mednafen
