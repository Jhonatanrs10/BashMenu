#!/usr/bin/env sh
source ./scripts/dependencias.sh
dependencias
resp="vazio"
while [ "$resp" != "exit" ];
do

subMenuPosInstall(){
    while [ "$resp" != "exit" ];
    do
        menu12345 "
[1] I3WM CONFIG
[2] XFCE4 CONFIG
[3] LIGHTDM CONFIG
[4] BACKLIGHT CONFIG
[5] GRUB CONFIG
[6] PACMAN CONFIG
" "i3wmConfig
" "xfce4Config
" "lightdmConfig
" "backlightConfig
" "attGrubWithWindows
" "editPacmanConfig"

        menu12345 "
[1] INSTALL YAY [ARCH][AUR]
[2] INSTALL MYARCH I3WM [PACMAN][YAY]
[3] INSTALL MYARCH XFCE4 [YAY]
[4] INSTALL MYARCH KDE [YAY]
[5] INSTALL MYARCH GNOME [YAY]
[6] NVIDIA PROPRIETARIO
" "appPosYay
" "myBaseI3wm
" "myBaseXfce4
" "myBaseKde
" "myBaseGnome
" "appPosNvidiaDriverProp"
    done
}

subMenuGit(){
    while [ "$resp" != "exit" ];
    do
        menu12345 "
[1] GIT PUSH
[2] GIT CONFIG
[3] BASHMENU CONFIG
" "gitAutoPush
" "gitconfig
" "dependenciasAtalho" 
    done
}

subMenuInstallApps(){
    while [ "$resp" != "exit" ];
    do
        menu12345 "
[1] INSTALAR BONGOCAT
[2] INSTALAR POKEXGAMES
[3] INSTALAR MINECRAFT TLAUNCHER
[4] INSTALAR POSMIX APPS
[5] INSTALAR SOME APPS
" "bongo
" "installPokexgames
" "installMinecraft
" "appPosMix
" "appPosMixMy"

        menu12345 "
[1] INSTALAR MINECRAFT SERVER VERSION
[2] INSTALAR FIVEM SERVER
[3] INSTALAR UNTURNED SERVER
[4] INSTALAR SAMP SERVER
[5] INSTALAR TERRARIA SERVER
[6] INSTALAR HAMACHI E HAGUICHI [APT]
[7] INSTALAR ZEROTIER
[8] INSTALAR NGROK
" "installMinecraftServer
" "installFivem
" "installUnturnedServer
" "sampServer
" "terrariaServer
" "hamachi
" "zerotier
" "installNgrok"

        menu12345 "
[1] INSTALAR NODEJS LTS
[2] INSTALAR VIRTUAL GAMEPADS
[3] INSTALAR VIRTMANAGER [MAQUINA VIRTUAL]
" "nodejslts
" "virtualGamepads
" "appPosVirtManager"
    done
}

subMenuPastasAtalhos(){
    while [ "$resp" != "exit" ];
    do
        menu12345 "
[1] CRIA ATALHO DESKTOP
[2] CRIA ATALHO RETROARCH GAME
[3] CRIA ATALHO PASTA/ARQUIVO
[4] CRIA ATALHO BIN PARA COMANDOS DE TERMINAL
[5] CRIA ATALHO APPIMAGE
[6] REMOVE ATALHO DESKTOP
" "criaAtalhoDesktop
" "criaAtalhoDesktopRetroarchArch
" "criaArqRunDiretorioInstall
" "AtalhoTerminalBin
" "criaAtalhoDesktopAppimage
" "removeDesktopJRS"

        menu12345 "
[1] CRIAR PASTA COMPARTILHADA [USER]
[2] CRIAR PASTA COMPARTILHADA [GUEST]
" "criaPastaShareUser
" "criaPastaShareGuest"
    done
}

subMenuOutros(){
    while [ "$resp" != "exit" ];
    do
        menu12345 "
[1] MUDAR JAVA VERSION
[2] VIRTUAL PULSEAUDIO CONFIG
" "nodejslts
" "javaVersion
" "virtualGamepads
" "appPosVirtManager
" "virtualPulseAudioExec"

        menu12345 "
[1] NETWORK CONFIG
[2] POS MANUAL CONFIG
[3] BLUETOOTH FIX
[4] TECLADO CONFIG
[5] DATA E HORA CONFIG NTP
[6] TOUCHPAD CONFIG
[7] REPARAR PACKAGE MANAGER
" "appPosNetwork
" "appPosManualConfig
" "appPosBluetoothFix
" "appPosTecladoConfig
" "appPosTimeNTP
" "appPosI3Touchpad
" "repairPM"

        menu12345 "
[1] ASSISTIR PELO MPV
" "assistirMpv"
    done
}
##
menu12345 "
[1]POSINSTALL
[2]GIT
[3]INSTALL APPS
[4]PASTAS E ATALHOS
[5]OUTROS
[6]TESTE FASTFETCH
" "subMenuPosInstall
" "subMenuGit
" "subMenuInstallApps
" "subMenuPastasAtalhos
" "subMenuOutros
" "fastfetchConfig"
##
done
