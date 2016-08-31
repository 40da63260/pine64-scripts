#!/bin/bash


sudo nano /etc/sudoers
##
#sudo nano /etc/network/interfaces.d/eth0



########################################
##

#sudo nano /etc/sudoers
##
#sudo nano /etc/network/interfaces.d/eth0

##auto eth0
##iface eth0 inet static
## address 192.168.1.8
## gateway 192.168.1.1
## netmask 255.255.255.0


turnOffGraphics(){
sudo systemctl stop graphical.target && sudo systemctl disable graphical.target

sudo systemctl set-default multi-user.target
}


echo ""


