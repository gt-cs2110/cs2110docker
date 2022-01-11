#!/usr/bin/env bash
set -e

echo "Install VNC server"
# Replaced TigerVNC with TightVNC due to having up-to-date ARM builds
apt install -y tightvncserver
