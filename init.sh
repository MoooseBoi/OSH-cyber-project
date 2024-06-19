#!/bin/sh

local DEVICE=`echo $1 | sed 's/1/2/'`
local MOUNTPOINT="/mnt"

mount /dev/$DEVICE $MOUNTPOINT

cp /etc/resolv.conf $MOUNTPOINT/etc/resolv.conf
mount -t sysfs /sys "$MOUNTPOINT/sys"
mount -t proc /proc "$MOUNTPOINT/proc"
mount --bind /run "$MOUNTPOINT/run"
mount --bind /dev "$MOUNTPOINT/dev"
mount --bind /dev/pts "$MOUNTPOINT/dev/pts"
for swapfile in $(awk 'NR>1 {print $1}' /proc/swaps); do
  swapoff $swapfile
done

chroot $MOUNTPOINT agetty --noclear -L ttyS0 9600 $TERM
