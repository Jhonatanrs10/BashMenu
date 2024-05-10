#!/usr/bin/env sh
source ./scripts/dependencias.sh
dependencias
resp="vazio"
while [ "$resp" != "exit" ];
do
menu12345 "
[1] GIT PUSH
[2] ASSISTIR PELO MPV
[3] I3WM CONFIG
[4] CRIA ATALHO DESKTOP
[5] CRIA ATALHO RETROARCH GAME
[6] CRIA ATALHO PASTA/ARQUIVO
[7] CRIA ATALHO BIN PARA COMANDOS DE TERMINAL
" "gitAutoPush
" "assistirMpv
" "i3wmConfig
" "criaAtalhoDesktop
" "criaAtalhoDesktopRetroarchArch
" "criaArqRunDiretorioInstall
" "AtalhoTerminalBin"

menu12345 "
[1] BASHMENU CONFIG
[2] INSTALAR POSINSTALL
[3] GIT CONFIG
[4] CRIAR PASTA COMPARTILHADA (USER)
[5] CRIAR PASTA COMPARTILHADA (GUEST)
[6] INSTALAR BONGOCAT
[7] INSTALAR POKEXGAMES
[8] INSTALAR MINECRAFT TLAUNCHER
" "dependenciasAtalho
" "posInstall
" "gitconfig
" "criaPastaShareUser
" "criaPastaShareGuest
" "bongo
" "installPokexgames
" "installMinecraft"

menu12345 "
[1] INSTALAR MINECRAFT SERVER VERSION
[2] INSTALAR FIVEM SERVER
[3] INSTALAR UNTURNED SERVER
[4] INSTALAR SAMP SERVER
[5] INSTALAR TERRARIA SERVER
[6] INSTALAR HAMACHI E HAGUICHI (APT)
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
[4] REMOVER TODOS ATALHOS RETROARCH
" "nodejslts
" "javaVersion
" "virtualGamepads
" "removeAllDesktopRetroarchArch"

done
