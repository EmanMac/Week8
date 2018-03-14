#!/bin/bash

echo "This script is designed to give you a basic concept of working on linux the Linux terminal. Please select a number at the menu
to bring up a guide that will walk you through some basic commands for grasping Linux."

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
echo "The most basic means of find out where you are is the 'ls' command. Let's try it to see where we are."
cd
ls
read

echo "You can get a long listing version of the command with ls -l, which will give you listing of file permissions, date of last 
modification as well as showing hidden files."
ls -l
read

echo " The 'pwd', or print working directory, will give you a full pathname of the current directory you are in."
pwd
read

echo "we can put a directory into this one with the mkdir command."
mkdir Derp
read 

echo "and there it is. "
ls
read

echo "Let's move into the new folder with the cd command followed by the folder's name."
cd Derp

echo "Now we will make a new file in this folder with the touch command."
touch derp1

echo "And there it is."
ls
read

echo "Now let's put something in there by echoing some text into it followed by the'>' symbol"
echo "derpderp" > derp1

echo "We can read what we put into the file with the 'cat' command, as well as use a wildcard * to finish the command for us"
cat derp*
read

echo "cp will allow you to make a copy of a file, just use the cp command, followed by the filename, then the new filename."
cp derp1 derp2

echo "Let's put some text into the second file"
echo "blerpblerpblerp" > derp2
echo "perfunctory text goes here" >> derp2

echo "You can see we put 2 lines of text in here."
cat derp2
read

echo "If we want to cat a certain part of the text we can use the grep command. To grep the first line of text."
cat derp2 | grep 'blerp'
read

echo "let's zip this file right up using gzip, you know, incase you have to fit 80,000 of these files onto a floppy disk."
gzip derp1

echo "What strange alien language is this! Better unzip this so we can cat it again."
echo ""
cat derp1.gz
read
gunzip derp1.gz
cat derp1
echo "It's uzipped again now"
read

echo "Let's clean this mess up a bit."
sudo rm derp1
sudo rm derp2
cd ..
sudo rmdir Derp 

echo "One final thing, is you can use the echo -e command to put line breaks in your echos with \n"
echo -e "I wrote this dumb haiku\n to show you how to write commands\n that won't suck and run"

press_enter
;;

	2 )
#Rough draft, will be fleshing this out more

echo "Putting anything into the /dev/null folder is a bit like screaming into the void, it is instantly disregarded without predjudice."
echo "derp" > /dev/null

echo " let's move to the dev folder so we can take a look around. This is where your devices can be found."
echo " you might find some things in there that look familiar, like dvd or cdrom"
cd /dev
read
ls -l
read

echo "to get more information about our devices we have blkid as an option. This will locate and print the device attributes."

sudo blkid
read

echo "That format is hard to read and makes my head hurt, let's use a more comprehensible command, lsblk."
lsblk
read

echo "The find command  is useful for finding information on your system. Let's search sys with a cdrom grep to see waat happens."
find /sys | grep cdrom | less
read

echo "Now let's do a search for tty files within the dev and /dev/mapper folders."
ls -l /dev /dev/mapper  | grep 'tty' | less
read

echo "We can take a look at hour our memory is doing with the 'free' command. This command is generally used without options."
free
read

cd /tmp

echo "Now it's time to destroy our disks!!! Errrr, I mean the dd command will read from an input file and stream it to an output file."
echo "The format is a bit wonky on this one, where if=input file, of=output file, bs=block size, and the count is how many blocks will copy."
echo "Our input file is dev/zero so it will basically dump a bunch of null data into a file. If you dd it to something important you can wipe it."
dd if=/dev/zero of=./empty.file bs=1M count=1

echo "Let's hexdump this bishhhh." 
hexdump -C empty.file

echo "Let's look in this folder."
ls -l
read

rm empty.file
echo "Aaaaannnnnd, it's gone."
ls -l
read

echo "The dmesg command will display messages from the kernel. This command is great for troubleshooting your system. Let's take a look at a sample of our system's logs."
sudo dmesg /var/log/messages | tail
read

echo "And now some nonsensicle information about our CPU output."
echo "As a side note you need to run this command in sudo."
sudo dmesg | grep -i CPU
read

press_enter
;;

	3 )ls
#Rough draft, will be fleshing this out more

echo "Let's move to tmp for this one." 
cd /tmp

echo "first let's take a look at our partitions with the parted command."
sudo parted -l
read

echo "We are using the dd command again to output a string of zeros to an image file which we will be mounting."
dd if=/dev/zero of=./32MB.img bs=1M count=32
hexdump ./32MB.img
sleep 5

echo "now we will use the mkfs command to create a file as an extended 4 partition with the -t ext4 option."
sudo mkfs -t ext4 ./32MB.img
sleep 5

echo " We can see a rather large list of mkfs options by looking in our sbin. Each filesystem listed has its own man page."
ls -l /sbin/mkfs.*
echo "Let's check out one of their man pages."
read
man mkfs.ext3

echo "let's mount this badboy into a folder where it won't bother us too much."
sudo mkdir /mnt/tmp
sleep 5

echo "And now we mount it. Basically we are attaching the file to our system. "
sudo mount ./32MB.img /mnt/tmp
sleep 5

echo "Let's take a looksie into our current filesystem status, our new device should show up."
mount
read

echo "a very useful and easy command is 'df', which will check for diskspace. Adding the -h option will make it human readable, meaning it will give you data in bytes, megabytes, and gigabytes."
df -h
read

echo "Let's take a look at the at the filesystem we created."
cd /mnt/tmp
ls
read

echo "And drop a little derp into there. "
sudo echo "Derp" > ./derp.txt
cat derp*
read

echo "Now we just unmount this javla sak."
sudo umount /mnt/tmp
rm derp.txt

press_enter
;;

	4 )ls
#Rough draft, will be fleshing this out more

echo "To determine runlevels we can use the who command. If you are using a GUI, you are probably running at level 5."
echo "Apparently runlevels are becoming a thing of the past though, much like my proclivity for self-control around Hamburger Helper."
who -r
read

echo "Most systems these days are running on systemd. If this ls doesn't come up with anything most of these commands will not work."
sudo ls /usr/lib/systemd
echo "Are any files showed there? If so you have systemd."
read

echo "The systemctl command is one of the most essential commands that obtains unit information. The list-units option lists active units in your filesystem." 
sudo systemctl list-units
read

echo "The UnitPath suffix  will show the path of the systemd files."
sudo systemctl -p UnitPath show
read

echo " list-dependencies does just as the name implies."
sudo systemctl list-dependencies
read

echo "We can see the status of specific units with the status option. Let's try it on cron."
systemctl status cron
read

echo "Let's create our own fs that is dependant upon another and make sure it runs!"

cd /etc/systemd/system
cd
echo "[Unit]" > derp1.target
echo "Description=derp 1" >> derp1.target
echo "[Unit]" > derp2.target
echo "Description=derp 2" >> derp2.target
echo "Wants=derp1.target" >> derp2.target
cp derp1.target /etc/systemd/system
cp derp2.target /etc/systemd/system
sudo systemctl start derp2.target
systemctl status derp1.target derp2.target
echo "There it is folks, a thing of beauty. Let's turn this thing off and clean it up."
read

systemctl stop derp1.target 
systemctl stop derp2.target
systemctl disable derp1.target
systemctl disable derp2.target
rm derp1.target derp2.target
press_enter
;;
	0 ) exit;;
	* ) "Please enter 1-4, or 0"
	esac
done
