#!/bin/bash
# 

set -e

if [ "$(id -u)" -ne "0" ]
then
	echo "This script requires root."
	exit 1
fi

selectTime(){
	
	dpkg-reconfigure tzdata

}

passwordNewUser(){
	
	echo "set root password"
	passwd root

	echo "set ubuntu password"
	passwd ubuntu

	echo "what would you like your username to be? type name -then [ENTER] - follow directions"
	read name
	adduser $name

	numLine=$(sudo grep -n 'root' /etc/sudoers | grep "ALL=(" | sed -e 's/\([0-9][0-9]\).*/\1/')
	##echo "$name ALL=(ALL:ALL) ALL" | sed -i '$numLine /dev/stdin' /etc/sudoers
	numLine=$("++numLine"i)
	sed -i '$numLine\$name ALL=(ALL:ALL) ALL' /etc/sudoers
	
}

doLongsleepScripts(){

	/usr/local/sbin/resize_rootfs.sh 
	/usr/local/sbin/pine64_fix_whatever.sh
	/usr/local/sbin/pine64_update_uboot.sh
	/usr/local/sbin/pine64_update_kernel.sh

}

firstRoundInstallStuff() {

	apt-get update
	apt-get install python \
	man \
	nano \
	fish \
	tmux \
	cpufrequtils \
	sysfsutils \
	git \
	wget \
	curl \
	iputils-ping \
	libpam-systemd -yV
	apt-get upgrade -yV

}

boot(){
	
	systemctl daemon-reload
	systemctl reboot

}

changeHostname(){

	echo "What do you want you're new hostname to be -  <rightnow it is pine64"
	read host
	echo "$host" > /etc/hostname
	sed -i 's/pine64/$host/g' /etc/hosts
}

selectTime
passwordNewUser
doLongsleepScripts
firstRoundInstallStuff
changeHostname
boot
