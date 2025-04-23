#!/usr/bin/env sh
myBaseYay(){
    #pacman -Sy --needed git base-devel
    

    echo "Yay Install
Options: [1]Yes, [2]No"
    read resp
	case $resp in
		1)
            cd $HOME
            git clone https://aur.archlinux.org/yay.git
            cd yay
            makepkg -si
        ;;
        *)
        ;;
    esac
}
