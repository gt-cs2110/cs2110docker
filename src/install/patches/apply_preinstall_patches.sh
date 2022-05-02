#!/usr/bin/env bash

set -euo pipefail

apt-get update
apt-get install -y patch
apt-get clean -y

# Don't exclude man pages
patch -u /etc/dpkg/dpkg.cfg.d/excludes -i $INST_SCRIPTS/patches/dont-exclude-man.patch
patch -u /etc/dpkg/dpkg.cfg.d/excludes -i $INST_SCRIPTS/patches/dont-include-changelogs.patch

# Don't install recommends by default
echo 'APT::Install-Recommends "false";' > /etc/apt/apt.conf.d/99-no-install-recommends
