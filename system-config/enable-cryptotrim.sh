#!/bin/sh
#
# Enable TRIM on LUKS/LVM
#

if [ "`id -u`" != "0" ]; then
    echo "Must be run as root" 1>&2
    exit 1
fi

sed -i '' 's/issue_discards = 0/issue_discards = 1/g' /etc/lvm/lvm.conf
sed -i '' 's/luks/luks,discard/g' /etc/crypttab
update-initramfs -u
