# Scripts to flip webcam on Asus notebooks
- Meant for the heyalter project, currently only works on ubuntu. Not really tested yet.
- Note: kernel must be up-to-date, or installation of v4l2loopback-dkms will fail

## Usage ##
- clone repository
- run cam_setup.sh as root to install packages, insert modules and setup the swapcam.service systemd unit.
- run kamera_install.sh as user to install systemd user service
- run 'kamera.sh start' as user to start ffmpeg, 'kamera.sh stop' to stop it. (Very dirty hack)
