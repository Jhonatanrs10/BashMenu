#!/usr/bin/env sh
supFlatpakApt(){
    sudo add-apt-repository ppa:flatpak/stable
    sudo apt update
    sudo apt install flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}
#debian ubuntu bases