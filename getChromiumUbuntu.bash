#!/bin/bash

set -e

if [ "$(id -u)" -ne "0" ]; then
	echo "This script requires root."
	exit 1
fi


getDependencies(){
	apt-get update && apt-get install curl -y 
}

getInstalljpeglibrary(){
	curl -o jpeglib.deb http://ftp.nl.debian.org/debian/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_1.5.0-1_arm64.deb
	dpkg -i jpeglib.deb
	rm -f jpeglib.deb 
}

getInstallChromium(){
	curl -o chromium.deb http://repo.linaro.org/ubuntu/linaro-overlay/pool/main/c/chromium-browser/chromium_52.0.2743.116-1~deb8u1.1_arm64.deb
	dpkg -i chromium.deb
	rm -f chromium.deb
}

aliasAndOpen(){
	alias chrome='chromium --disable-seccomp-filter-sandbox --disk-cache-size=200'
	chrome &
}


getDependencies
getInstalljpeglibrary
getInstallChromium
aliasAndOpen
