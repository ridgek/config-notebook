#!/bin/sh
#
# Setup plymouth splash screen
#

if [ "`id -u`" != "0" ]; then
    echo "Must be run as root" 1>&2
    exit 1
fi

apt-get install plymouth plymouth-themes

# KMS
MODULES=/etc/initramfs-tools/modules
grep -q -F '^intel_agp' $MODULES || echo 'intel_agp' >> $MODULES
grep -q -F '^drm' $MODULES || echo 'drm' >> $MODULES
grep -q -F '^i915' $MODULES || echo 'i915 modeset=1' >> $MODULES

sed -i '' 's/^#GRUB_GFXMODE=.*$/GRUB_GFXMODE=1366x768/g' /etc/default/grub
sed -i '' 's/^#GRUB_CMDLINE_LINUX_DEFAULT="quiet".*$/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/g' /etc/default/grub

update-grub
update-initramfs -u
