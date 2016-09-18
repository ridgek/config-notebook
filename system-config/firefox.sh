#!/bin/sh
#
# Install Firefox Developer Edition
#

if [ "`id -u`" != "0" ]; then
    echo "Must be run as root" 1>&2
    exit 1
fi

echo "deb http://mozilla.debian.net/ experimental firefox-aurora" > /etc/apt/sources.list.d/mozilla.list

apt-get install pkg-mozilla-archive-keyring
apt-get update
apt-get install -t experimental firefox

echo "Don't forget: https://addons.mozilla.org/en-US/firefox/addon/ublock-origin"
