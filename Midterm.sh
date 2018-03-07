#!/bin/bash

echo "This is a placeholder for the start of the script. The idea is to
 create a learning experience for newer linux users in a fairly interactive manner with the menu 
and will eventually have fairly indepth echo commands with explainations of what the commands do"

press_enter()
{
	echo -en "\nPress Enter to continue"
	read
	clear
}


selection=
until [ "$selection" = "0" ]; do
	echo "
	PROGRAM MENU
	1 - Basic commands and Directory Hierarchy
	2 - Devices
	3 - Disks and Filesystems
	4 - User Spaces
	0 - Exit the program
"
	echo -n "Enter selection: "
	read selection
	echo ""
	case $selection in

	1 )
#Rough draft, will be fleshing this out more

ls -l
pwd
cd /tmp
ls
sudo mkdir Derp
ls
touch derp1
ls
echo "derpderp" > derp1
cat derp*
cp derp1 derp2
echo "blerpblerpblerp" > derp2
echo "perfunctory text goes here" >> derp2
cat derp2 | grep 'blerp'

gzip derp1
cat derp1.gz
gunzip derp1.gz


sudo rm derp1
sudo rm derp2
sudo rmdir Derp 

press_enter
;;

	2 )
#Rough draft, will be fleshing this out more

echo "derp" > /dev/null
cd /dev
ls -l
sudo blkid
lsblk
find /sys | grep sd | less
ls -l /dev /dev/mapper | grep '^b'
ls /proc/partitions

free

#cd ~; pwd
cd /tmp

dd if=/dev/zero of= ./empty.file bs=1M count=1
hexdump empty.file
ls -l
rm empty.file
ls -l

sudo dmesg | grep sd
sudo dmesg | grep -i CPU

press_enter
;;

	3 )ls
#Rough draft, will be fleshing this out more

cd /tmp
dd if=/dev/zero of=./32MB.img bs=1M count=32
hexdump ./32MB.img
sudo mkfs -t ext4 ./32MB.img

ls -l /sbin/mkfs.*

sudo mkdir /mnt/tmp
sudo mount ./32.MB.img /mnt/tmp
mount

df -h

lsblk

cd /mnt/tmp
ls
echo "Derp" > ./derp.txt
sudo umount /mnt/tmp
rm derp.txt
free

press_enter
;;

	4 )ls
#Rough draft, will be fleshing this out more


who -r
ls /usr.lib/systemd
sudo systemctl list-units
sudo systemctl -p UnitPath show
sudo systemctl list-dependencies
sudo system-analyze critical-chain

cd /usr/lib/systemd/ 
ls

press_enter
;;
	0 ) exit;;
	* ) "Please enter 1-4, or 0"
	esac
done
