#!/usr/bin/env sh
supFlatpak(){
    sudo add-apt-repository ppa:flatpak/stable
    sudo apt update
    sudo apt install flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    sudo pacman -S flatpak
}
#debian ubuntu bases