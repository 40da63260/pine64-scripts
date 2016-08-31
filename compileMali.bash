#!/bin/bash

declare -i warinfo

warinfo=0

noWarranty(){
	echo ""
	echo "This doesn't come with a warranty! In fact, it comes with a big non-warranty!
By using this you are assuming things will go horribly wrong - AND - AND
- you will not complain on the forums or subreddits feel free to hit me up 
on github - if you have suggestions - complaints no thanks"
	echo ""
	echo "Do you understand?[y = yes] "
	read affirmation
	if echo "$affirmation" | grep -iq "^y"
	then
	echo $((++warinfo)) > /dev/null
	fi
}

compileIt(){
	getDepends
	gitFiles
	malification
}

gitFiles(){
	git clone --depth 1 --branch pine64-hacks-1.2 --single-branch https://github.com/longsleep/linux-pine64.git linux-pine64
}

getDepends(){
	sudo apt-get update
	sudo apt-get install git build-essential -y
}

malification(){
	cd linux-pine64
	cd modules/gpu
	LICHEE_KDIR=$(pwd)/../.. ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- LICHEE_PLATFORM=Pine64 make build
	sudo cp mali400/kernel_mode/driver/src/devicedrv/mali/mali.ko /lib/modules/3.10.102-3-pine64-longsleep/kernel/extramodules/mali.ko 
	sudo bash
	echo "mali" >> /etc/modules
}

noWarranty
noWarranty
if [ "$warinfo" -ge 2 ];
then
compileIt
else
echo "no soup for you"
fi
