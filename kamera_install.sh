#!/bin/bash
# Install kamera.service
# run as user
KAM_PATH=${HOME}/.config/systemd/user
mkdir -p $KAM_PATH
cp ./kamera.service $KAM_PATH
systemctl --user daemon-reload
systemctl enable --now --user kamera.service