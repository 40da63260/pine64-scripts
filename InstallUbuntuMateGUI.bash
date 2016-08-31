#!/bin/bash

echo "this will take a long time."

installGraphicsStuff(){
	sudo apt-get update
	sudo apt-get -y install \
			xserver-xorg-video-fbturbo \
			sunxi-disp-tool \
			libvdpau-sunxi1 \
			libump \
			libcedrus1 \
}

installGUIStuff(){
	sudo apt-get -y install ubuntu-mate-core \
			ubuntu-mate-desktop \
			ubuntu-mate-lightdm-theme \
			ubuntu-mate-wallpapers-xenial \
			lightdm
}

installGraphicsStuff
installGUIStuff
