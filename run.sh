#!/usr/bin/env sh
source ./scripts/dependencias.sh
dependencias
resp="vazio"
while [ "$resp" != "exit" ];
do
menu12345 "
[1] GIT CONFIG
[2] GIT PUSH
[3] ASSISTIR PELO MPV
" "gitconfig
" "gitAutoPush
" "assistirMpv
" "return
" "return"

menu12345 "
[1] INSTALAR MINECRAFT TLAUNCHER
[2] INSTALAR MINECRAFT SERVER
[3] INSTALAR MINECRAFT SERVER VERSION
[4] INSTALAR MINECRAFT SERVER FORGE 1.7.10 ESCADONA LUCKY BLOCK
[5] MUDAR JAVA VERSION
" "installMinecraft
" "installMinecraftServer
" "installMinecraftServerVersion
" "installMinecraftServerForge
" "javaVersion"

menu12345 "
[1] INSTALAR HAMACHI E HAGUICHI (APT)
[2] INSTALAR ZEROTIER
[3] INSTALAR NGROK
[4] INSTALAR DOCKER (APT)
[5] INSTALAR DOCKERZEROTIER
" "hamachi
" "zerotier
" "installNgrok
" "docker
" "dockerZeroTier"

menu12345 "
[1] INSTALAR BONGOCAT
[2] INSTALAR POKEXGAMES
[3] INSTALAR FIREFOX
" "bongo
" "installPokexgames
" "installFirefox
" "return
" "return"

menu12345 "
[1] INSTALAR FIVEM SERVER
[2] INSTALAR UNTURNED SERVER
[3] INSTALAR SAMP SERVER
[4] INSTALAR TERRARIA SERVER
" "installFivem
" "installUnturnedServer
" "sampServer
" "terrariaServer
" "return"
menu12345 "
[1] INSTALAR NODEJS LTS
" "nodejslts
" "return
" "return
" "return
" "return"

menu12345 "
[1] CRIAR PASTA COMPARTILHADA (SHARE)
[2] CRIAR PASTA COMPARTILHADA (GUEST)
" "criaPastaShareUser
" "criaPastaShareGuest
" "return
" "return
" "return"

menu12345 "
[1] CRIA ATALHO BIN PARA COMANDOS DE TERMINAL
[2] REPARAR APT
[3] INSTALAR POSINSTALL
[4] CRIA ATALHO DESKTOP
[5] CRIA ATALHO PASTA/ARQUIVO
" "AtalhoTerminalBin
" "repararApt
" "posInstall
" "criaAtalhoDesktop
" "criaArqRunDiretorioInstall"

done