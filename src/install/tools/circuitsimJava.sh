#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install circuitsim"
apt-get update && apt-get install -y xserver-xorg-video-dummy
apt-get install -y libgl1-mesa-glx openjdk-17-jdk openjfx
