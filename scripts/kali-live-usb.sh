#! /bin/bash -x

# Zero out beginning of disk
dd if=/dev/zero of=/dev/sdb bs=1k  count=40000

# Write ISO
dd if=/home/ken/Downloads/kali-linux-2018.1-amd64.iso of=/dev/sdb bs=512k

# Add 3rd partition
#read start _ < <(du -bcm kali-linux-2018.1-amd64.iso | tail -1); echo $start
parted /dev/sdb mkpart primary 3029 4028

# Add presistence
mkfs.ext3 -L persistence /dev/sdb3
e2label /dev/sdb3 persistence
mkdir -p /mnt/my_usb
mount /dev/sdb3 /mnt/my_usb
echo "/ union" > /mnt/my_usb/persistence.conf
umount /dev/sdb3
