#!/usr/bin/env bash

set -e

echo "Install POSIX man pages"
apt-get update
apt-get install -y man man-db manpages manpages-dev manpages-posix
apt-get clean -y

# Ubuntu minimal diverts /usr/bin/man to a shell script; restore the real man
rm -f /usr/bin/man
dpkg-divert --quiet --remove --rename /usr/bin/man

# Get a better pager
apt-get install -y less

rm -rf /var/lib/apt/lists/*