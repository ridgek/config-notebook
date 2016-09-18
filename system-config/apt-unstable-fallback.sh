#!/bin/sh
#
# Configure Debian Testing to use unstable packages when testing packages are
# unavailable.
#

if [ "`id -u`" != "0" ]; then
    echo "Must be run as root" 1>&2
    exit 1
fi

cat <<EOF > /etc/apt/preferences.d/unstable-fallback
Package: *
Pin: release a=testing
Pin-Priority: 900

Package: *
Pin: release a=unstable
Pin-Priority: 400
EOF
