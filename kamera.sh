#!/bin/bash
# Kopiert und dreht Video zur virtuellen Kamera
#ffmpeg -f v4l2 -i /dev/video9 -vf "vflip" -f v4l2 /dev/video0
if [ "$1" == "start" ]; then
    systemctl --user start kamera.service
else
    systemctl --user stop kamera.service
fi
