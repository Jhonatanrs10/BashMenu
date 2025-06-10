#!/usr/bin/env sh
source ./lib/sourceFolder.sh
sourceFolder "LIBs" "./lib"
sourceFolder "Scripts" "./scripts"

option="vazio"
while [ "$option" != "exit" ];
do
   echo -e "
[01] Pos Install
[02] Grub
[03] Pacman
[04] Montar NTFS
[05] Linkar Home
[06] Yay
[07] Video Driver
[08] VirtManager
[09] Diretório Inode Padrão
[10] Git Auto Push
[11] Configuração Git
[12] Dependências Atalho
[13] Bongo
[14] Pokexgames
[15] Minecraft
[16] Servidor Minecraft
[17] FiveM
[18] Servidor Unturned
[19] Servidor SA-MP
[20] Servidor Terraria
[21] Hamachi
[22] ZeroTier
[23] Ngrok
[24] Node LTS
[25] Java Install/Version
[26] Gamepads Virtuais
[27] Atalho Desktop
[28] Atalho Desktop Retroarch (Arch)
[29] Criar Arquivo de Execução por Diretório
[30] Atalho Terminal
[31] Setup AppImage
[32] Remover Atalhos JRS
[33] Pasta Compartilhada (User)
[34] Pasta Compartilhada (Guest)
[35] Execução PulseAudio Virtual
[36] Pós-Rede
[37] Pós-Configuração Manual
[38] Pós-Fix Bluetooth
[39] Pós-Teclado
[40] Pós-Hora (NTP)
[41] Pós-Touchpad (i3)
[42] Reparar Pacman
[43] Assistir com MPV
[44] Samba Setup
"
    read option
    case $option in
        1)myBasePosInstall;;
        2)myBaseGrub;;
        3)myBasePacman;;
        4)myBaseMountNTFS;;
        5)myBaselnHome;;
        6)myBaseYay;;
        7)installVideoDriver;;
        8)installVirtManager;;
        9)defaultInodeDirectory;;
        10)gitAutoPush;;
        11)gitconfig;;
        12)dependenciasAtalho;;
        13)bongo;;
        14)installPokexgames;;
        15)installMinecraft;;
        16)installMinecraftServer;;
        17)installFivem;;
        18)installUnturnedServer;;
        19)sampServer;;
        20)terrariaServer;;
        21)hamachi;;
        22)zerotier;;
        23)installNgrok;;
        24)nodejslts;;
        25)installJava;;
        26)virtualGamepads;;
        27)criaAtalhoDesktop;;
        28)criaAtalhoDesktopRetroarchArch;;
        29)criaArqRunDiretorioInstall;;
        30)AtalhoTerminalBin;;
        31)setupAppimage;;
        32)removeDesktopJRS;;
        33)criaPastaShareUser;;
        34)criaPastaShareGuest;;
        35)virtualPulseAudioExec;;
        36)appPosNetwork;;
        37)appPosManualConfig;;
        38)appPosBluetoothFix;;
        39)appPosTecladoConfig;;
        40)appPosTimeNTP;;
        41)appPosI3Touchpad;;
        42)repairPM;;
        43)assistirMpv;;
        44)sambaSetup;;
        *);;
    esac
done