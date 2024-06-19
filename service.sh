#!/bin/sh

MOUNTPOINT="/tmp/chroot"
KEY_UUID=""
DEVICE=`lsblk -n -r -o NAME,UUID | grep -w $KEY_UUID | cut -d " " -f 1`

if [[ -z $DEVICE ]]; then
  agetty -o '-p -- \\u' --noclear - $TERM
fi 

unshare --mount
mkdir -p $MOUNTPOINT
mount /dev/$DEVICE $MOUNTPOINT
exec $MOUNTPOINT/init.sh $DEVICE
umount $MOUNTPOINT
