# Scripts to flip webcam on Asus notebooks
- Meant for the heyalter project, currently only works on ubuntu. Not really tested yet.
- Note: kernel must be up-to-date, or installation of v4l2loopback-dkms will fail

## Usage ##
- clone repository
- run cam_setup.sh as root to install packages, insert modules and setup the swapcam.service systemd unit.
- run kamera_install.sh as user to install systemd user service
- run 'kamera.sh start' as user to start ffmpeg, 'kamera.sh stop' to stop it. (Very dirty hack)

## Details ##
- First we install v4l2loopback-dkms, v4l2loopback-utils and ffmpeg.
- The v4l2loopback module is loaded at boot, and creates a virtual camera on /dev/video7
- The swapcam.service executes /etc/swapcam.sh, which moves the default /dev/video0 to video9, and makes the virtual video7 the default video0.
- The kamera_install.sh script creates $HOME/.config/systemd/user, and copies the kamera.service unit file there.
- This unit file contains the ffmpeg command, which copies the frames from the built-in camera to the virtual loopback camera.
- The kamera.sh script simply runs "systemctl --user start/stop kamera.service", i.e. the service unit as user.
