#!/usr/bin/env sh
source ./scripts/dependencias.sh
dependencias

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
" "bongo
" "installPokexgames"

menu12345 "
[1] CRIAR PASTA COMPARTILHADA (SHARE)
[2] CRIA ATALHO BIN PARA COMANDOS DE TERMINAL
[3] REMOVE ATALHO BIN JRS
" "criaPastaShareUser
" "criaAtalhoTerminalBin
" "removeAtalhoBinJrs"

menu12345 "
[1] REPARAR APT
[2] INSTALAR POSINSTALL (APT)
[3] INSTALAR I3WM (APT)
[4] CONFIGURAR I3WM
" "repararApt
" "posInstall
" "i3wmInstallDebBase
" "i3wmConfig"

