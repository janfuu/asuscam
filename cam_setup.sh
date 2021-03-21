#!/bin/bash
### Script to install necessary packages for webcam loopback ###
### Must be run as root ###

echo "installing packages"
apt-get install -y v4l2loopback-dkms v4l2loopback-util ffmpeg

echo "installing v4l2loopback module"
echo "v4l2loopback" > /etc/modules-load.d/v4l2loopback.conf
cp ./v4l2loopback.conf /etc/modprobe.d/v4l2loopback.conf

echo "updating the initrd"
update-initramfs -u 

echo "installing swapcam script to /etc/swapcam"
chmod a+x ./swapcam.sh 
cp swapcam.sh /etc/swapcam.sh 

echo "Installing swapcam.service"
cp swapcam.service /etc/systemd/system/swapcam.service

echo "Starting and enabling swapcam.service"
systemctl daemon-reload
systemctl enable --now swapcam.service
