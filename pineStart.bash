#!/bin/bash
# 

selecttime(){
	
	echo "because you didn't read the script - we are setting the time to UTC"
	timedatectl set-timezone utc

}

passwordNewUser(){
	
	echo "set root password"
	passwd root

	echo "set ubuntu password"
	passwd ubuntu

	echo "what would you like your username to be? type name -then [ENTER] - follow directions"
	read name
	adduser $name

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


reboot(){
	
	sudo systemctl daemon-reload
	sudo systemctl reboot

}

changeHostname(){

		echo "What do you want you're new hostname to be -  <rightnow it is pine64"
		read host
		sudo  echo "$host" > /etc/hostname
		sudo sed -i 's/pine64/$host/g' /etc/hosts
}

selecttime
passwordNewUser
doLongsleepScripts
firstRoundInstallStuff
changeHostname
reboot
