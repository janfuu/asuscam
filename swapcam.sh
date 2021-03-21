#!/bin/bash

if ["$1" == "-r"]; then
    # switch back
    mv /dev/video0 /dev/video7
    mv /dev/video9 /dev/video0
else
    mv /dev/video0 /dev/video9 # move default cam
    mv /dev/video7 /dev/video0 # make loopback cam default
fi