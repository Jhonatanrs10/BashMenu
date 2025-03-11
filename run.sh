#!/usr/bin/env sh
source ./lib/sourceFolder.sh
sourceFolder "LIBs" "./lib"
sourceFolder "Scripts" "./scripts"

#BashMenu Vars
############################
dBashMenu="$HOME/.bashmenu"
nomeRun="run"
DATANOW=$(date "+[%d-%m-%Y][%H-%M]")
############################

option="vazio"
while [ "$option" != "exit" ];
do
    echo "============================
 [1]
 [2]INSTALL YAY [ARCH][AUR]
 [3]INSTALL MYARCH I3WM 
 [4]INSTALL MYARCH BSPWM
 [5]INSTALL MYARCH HYPRLAND
 [6]INSTALL MYARCH XFCE4
 [7]INSTALL MYARCH KDE
 [8]CONFIGURAR SYMBLINK PRA HOME 
 [9]NVIDIA PROPRIETARIO
[10]SOME APPS TO INSTALL
============================
[11]BACKLIGHT CONFIG
[12]GRUB CONFIG
[13]PACMAN CONFIG
[14]MOUNT-NTFS CONFIG
[15]DEFAULT FILEMANAGER
[16]GIT PUSH
[17]GIT CONFIG
[18]BASHMENU CONFIG
============================
[19]INSTALAR BONGOCAT
[20]INSTALAR POKEXGAMES
[21]INSTALAR MINECRAFT TLAUNCHER
[22]INSTALAR MINECRAFT SERVER VERSION
[23]INSTALAR FIVEM SERVER
[24]INSTALAR UNTURNED SERVER
[25]INSTALAR SAMP SERVER
[26]INSTALAR TERRARIA SERVER
[27]INSTALAR HAMACHI E HAGUICHI [APT]
[28]INSTALAR ZEROTIER
[29]INSTALAR NGROK
============================
[30]INSTALAR NODEJS LTS
[31]MUDAR JAVA VERSION
[32]INSTALAR VIRTUAL GAMEPADS
[33]INSTALAR VIRTMANAGER [MAQUINA VIRTUAL]
============================
[34]CRIA ATALHO DESKTOP
[35]CRIA ATALHO RETROARCH GAME
[36]CRIA ATALHO PASTA/ARQUIVO
[37]CRIA ATALHO BIN PARA COMANDOS DE TERMINAL
[38]CRIA ATALHO APPIMAGE
[39]REMOVE ATALHO DESKTOP
============================
[40]CRIAR PASTA COMPARTILHADA [USER]
[41]CRIAR PASTA COMPARTILHADA [GUEST]
============================
[42]VIRTUAL PULSEAUDIO CONFIG
============================
[43]NETWORK CONFIG
[44]POS MANUAL CONFIG
[45]BLUETOOTH FIX
[46]TECLADO CONFIG
[47]DATA E HORA CONFIG NTP
[48]TOUCHPAD CONFIG
[49]REPARAR PACKAGE MANAGER
============================
[50]ASSISTIR PELO MPV
============================
"
    read option
    case $option in
        1)dotfilesConfig;;
        2)appPosYay;;
        3)myBaseI3wm;;
        4)myBaseBspwm;;
        5)myBaseHyprland;;
        6)myBaseXfce4;;
        7)myBaseKde;;
        8)lnHome;;
        9)appPosNvidiaDriverProp;;
        10)appPosInstall;;
        11)backlightConfig;;
        12)attGrubWithWindows;;
        13)editPacmanConfig;;
        14)autoMountNtfs;;
        15)defaultInodeDirectory;;
        16)gitAutoPush;;
        17)gitconfig;;
        18)dependenciasAtalho;;
        19)bongo;;
        20)installPokexgames;;
        21)installMinecraft;;
        22)installMinecraftServer;;
        23)installFivem;;
        24)installUnturnedServer;;
        25)sampServer;;
        26)terrariaServer;;
        27)hamachi;;
        28)zerotier;;
        29)installNgrok;;
        30)nodejslts;;
        31)javaVersion;;
        32)virtualGamepads;;
        33)appPosVirtManager;;
        34)criaAtalhoDesktop;;
        35)criaAtalhoDesktopRetroarchArch;;
        36)criaArqRunDiretorioInstall;;
        37)AtalhoTerminalBin;;
        38)criaAtalhoDesktopAppimage;;
        39)removeDesktopJRS;;
        40)criaPastaShareUser;;
        41)criaPastaShareGuest;;
        42)virtualPulseAudioExec;;
        43)appPosNetwork;;
        44)appPosManualConfig;;
        45)appPosBluetoothFix;;
        46)appPosTecladoConfig;;
        47)appPosTimeNTP;;
        48)appPosI3Touchpad;;
        49)repairPM;;
        50)assistirMpv;;
        *);;
    esac
done