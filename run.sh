#!/usr/bin/env sh
source ./scripts/dependencias.sh
dependencias
resp="vazio"
while [ "$resp" != "exit" ];
do

menu12345 "TESTES
[1] Configurar MangoHud
[2] MYXFCE4
" "mangoHudConf
" "xfce4Config"

menu12345 "
[1] GIT PUSH
[2] ASSISTIR PELO MPV
[3] I3WM CONFIG
[4] LIGHTDM CONFIG
[5] BASHMENU CONFIG
" "gitAutoPush
" "assistirMpv
" "i3wmConfig
" "appPosLightdmConfig
" "dependenciasAtalho"

menu12345 "
[1] MYBASE CONFIG
[2] DESKTOP ENVIRONMENT
[3] SOME APPS
[4] NVIDIA PROPRIETARIO
" "appPosMyBase
" "appPosMyUtils
" "appPosMixMy
" "appPosNvidiaDriverProp"

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
[1] GIT CONFIG
[2] CRIAR PASTA COMPARTILHADA [USER]
[3] CRIAR PASTA COMPARTILHADA [GUEST]
[4] INSTALAR BONGOCAT
[5] INSTALAR POKEXGAMES
[6] INSTALAR MINECRAFT TLAUNCHER
[7] INSTALAR POSMIX APPS
[8] INSTALAR YAY [ARCH][AUR]
" "gitconfig
" "criaPastaShareUser
" "criaPastaShareGuest
" "bongo
" "installPokexgames
" "installMinecraft
" "appPosMix
" "appPosYay"

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
[2] MUDAR JAVA VERSION
[3] INSTALAR VIRTUAL GAMEPADS
[4] INSTALAR VIRTMANAGER [MAQUINA VIRTUAL]
" "nodejslts
" "javaVersion
" "virtualGamepads
" "appPosVirtManager"

menu12345 "
[1] NETWORK CONFIG
[2] POS MANUAL CONFIG
[3] BLUETOOTH FIX
[4] TECLADO CONFIG
[5] DATA E HORA CONFIG NTP
[6] TOUCHPAD CONFIG
" "appPosNetwork
" "appPosManualConfig
" "appPosBluetoothFix
" "appPosTecladoConfig
" "appPosTimeNTP
" "appPosI3Touchpad"


done
