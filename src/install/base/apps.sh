#!/usr/bin/env bash

set -euo pipefail

apt-get update

# PDF viewer (for Complx documentation in particular)
apt-get install -y evince

# minimal text editors, mostly for TA/professor use
# students generally shouldn't be editing inside the container
apt-get install -y vim nano

apt-get clean -y

rm -rf /var/lib/apt/lists/*