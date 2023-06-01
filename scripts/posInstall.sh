#!/usr/bin/env sh
posInstall(){
        yesorno "Deseja testar conexao?" "teste_internet"        
        travas_apt
        just_apt_update
        add_archi386
        yesorno "Instalar o Flatpak?" "supFlatpak"
        echo "PACOTES:
samba gparted neofetch blueman mpv vlc git wget openjdk-8-jdk openjdk-11-jdk openjdk-17-jdk htop qbittorrent"
        read pacotes
        installApt "$pacotes"
        baixaDebs "Chrome" "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
        baixaDebs "vscode" "https://go.microsoft.com/fwlink/?LinkID=760868"
        baixaDebs "Discord" "https://discord.com/api/download?platform=linux&format=deb"
        baixaDebs "Steam" "https://cdn.akamai.steamstatic.com/client/installer/steam.deb"
        yesorno "Deseja instalar os .deb?" "installDebs $diretorioBaixaDebs"
        yesorno "Deseja apagar a pasta dos .deb?" "rm -r $diretorioBaixaDebs"  

}