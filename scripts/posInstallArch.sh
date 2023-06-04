#!/usr/bin/env sh
posInstallArch(){
        #Programas
        sudo pacman -S nano git neofetch
        #Configuracoes
        echo "Remover comentarios de: 
#Color 
#ParallelDownloads = 10
ILoveCandy

#[multilib]
#Include = /etc/pacman.d/mirrorlist
"
        read pular
        sudo nano /etc/pacman.conf
        echo "Remover comentarios de: 
#WaylandEnable=false
"
        read pular
        sudo nano /etc/gdm3/custom.conf
        sudo systemctl restart gdm3
        #Atualiza o sistema
        sudo pacman -Syu
        #Firewall
        sudo pacman -S gufw
        #Codecs de video e audio
        sudo pacman -S ffmpeg gst-plugins-ugly gst-plugins-good gst-plugins-base gst-plugins-bad gst-libav gstreamer
        sudo pacman -S fwupd
        #Suporte para NTFS
        sudo pacman -S ntfs-3g
        #Habilitando bluetooth
        sudo systemctl enable bluetooth.service
        sudo systemctl start bluetooth.service --now
        #Suporte Flatpak
        sudo pacman -S flatpak
        #Pacotes da loja GNOME
        sudo pacman -S gnome-software-packagekit-plugin
        #Pacotes da loja KDE
        sudo pacman -S packagekit-qt5
        #Yay e Paru para gerenciar AUR
}