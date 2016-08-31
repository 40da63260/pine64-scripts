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

getDepend(){
	sudo apt-get update
	sudo apt-get install git build-essential kernel-package fakeroot libncurses5-dev libssl-dev ccache
}

getKernel(){
	git clone --depth 1 --branch pine64-hacks-1.2 --single-branch https://github.com/longsleep/linux-pine64.git linux-pine64
}

configureKernel(){
	cd linux-pine64
	make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- sun50iw1p1smp_linux_defconfig
}

compileDatKernelDoh(){
	make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- LOCALVERSION= clean
	make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j4 LOCALVERSION= Image
	cd modules/gpu
	LICHEE_KDIR=$(pwd)/../.. ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- LICHEE_PLATFORM=Pine64 make build
	cd ..
	cd ..
	make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j4 LOCALVERSION= modules
}

compileIt(){
	echo "this is going to take a mucho longtime"
	getDepend
	getKernel
	configureKernel
	compileDatKernelDoh
}



noWarranty
noWarranty
if [ "$warinfo" -ge 2 ];
then
compileIt
else
echo "no soup for you"
fi
