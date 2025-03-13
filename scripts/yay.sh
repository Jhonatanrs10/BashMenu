#!/usr/bin/env sh
myBaseYay(){
    #pacman -Sy --needed git base-devel
    cd $HOME
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
}