#!/bin/bash
# 

selecttime(){
  echo "because you didn't read the script - we are setting the time to UTC"
sudo timedatectl set-timezone utc
}

passwordNewUser(){
echo "set root password"
sudo passwd root

echo "set ubuntu password"
sudo passwd ubuntu

echo "what would you like your username to be? type name -then [ENTER] - follow directions"

read name

sudo adduser $name

}


doLongsleepScripts(){
sudo /usr/local/sbin/resize_rootfs.sh 

sudo /usr/local/sbin/pine64_fix_whatever.sh

sudo /usr/local/sbin/pine64_update_uboot.sh

sudo /usr/local/sbin/pine64_update_kernel.sh
}

firstRoundInstallStuff() {
sudo apt-get update

sudo apt-get install python man nano fish tmux cpufrequtils sysfsutils git wget curl iputils-ping libpam-systemd -y

sudo apt-get upgrade -y
}


reboot(){
sudo systemctl daemon-reload

sudo systemctl reboot
}

selecttime
passwordNewUser
doLongsleepScripts
firstRoundInstallStuff
reboot
