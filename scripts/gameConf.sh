#!/usr/bin/env sh
gamescopePriorityConf(){
    sudo setcap 'CAP_SYS_NICE=eip' $(which gamescope)
    sudo tee /etc/modprobe.d/nvidia-modeset.conf <<< 'options nvidia_drm modeset=1 fbdev=1'
}