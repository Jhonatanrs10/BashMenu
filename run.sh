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
   echo -e "
==================================================
                CONFIGURAÇÕES
==================================================
[ 1] Pós-Instalação          [ 2] Configurar GRUB
[ 3] Configurar Pacman       [ 4] Configurar NTFS
[ 5] Configurar lnHome       [ 6] Instalar Yay
[ 7] Configurar Stow         [ 8] Symlink para Home
[ 9] NVIDIA Proprietário     [10] Instalar Apps Essenciais

==================================================
                AJUSTES DO SISTEMA
==================================================
[11] Backlight Config        [12] GRUB Config
[13] Pacman Config           [14] NTFS Config
[15] File Manager Padrão     [16] Git Push
[17] Git Config              [18] BashMenu Config

==================================================
                INSTALAÇÕES
==================================================
[19] BongoCat                [20] PokéXGames
[21] Minecraft TLauncher     [22] Minecraft Server
[23] FiveM Server            [24] Unturned Server
[25] SAMP Server             [26] Terraria Server
[27] Hamachi & Haguichi      [28] ZeroTier
[29] Ngrok                  

==================================================
         AMBIENTE DE DESENVOLVIMENTO
==================================================
[30] Node.js LTS             [31] Alterar Java Versão
[32] Virtual Gamepads        [33] Virt-Manager (VMs)

==================================================
                ATALHOS
==================================================
[34] Atalho Desktop          [35] Atalho RetroArch
[36] Atalho Pasta/Arquivo    [37] Atalho Bin Terminal
[38] Atalho AppImage         [39] Remover Atalho

==================================================
         PASTAS COMPARTILHADAS
==================================================
[40] Pasta Compartilhada [USER]   [41] Pasta Compartilhada [GUEST]

==================================================
             ÁUDIO & REDE
==================================================
[42] Virtual PulseAudio      [43] Configurar Rede

==================================================
             AJUSTES FINAIS
==================================================
[44] Pós-Config Manual       [45] Fix Bluetooth
[46] Configurar Teclado      [47] Data & Hora (NTP)
[48] Configurar Touchpad     [49] Reparar Pacotes

==================================================
               MULTIMÍDIA
==================================================
[50] Assistir pelo MPV
==================================================
"
    read option
    case $option in
        1)myBasePosInstall;;
        2)myBaseGrub;;
        3)myBasePacman;;
        4)myBaseMountNTFS;;
        5)myBaselnHome;;
        6)myBaseYay;;
        7);;
        8);;
        9);;
        10);;
        11)installVirtManager;;
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
        33)installVirtManager;;
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