#!/usr/bin/env sh
source ./scripts/dependencias.sh
dependencias
resp="vazio"
while [ "$resp" != "exit" ];
do
menu12345 "
[1] ASSISTIR PELO MPV
[2] CRIA ARQUIVO PADRAO SAMBA
" "assistirMpv
" "criaSmbDefault
" "return
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
" "installFirefox"

menu12345 "
[1] CRIAR PASTA COMPARTILHADA (SHARE)
[2] CRIA ATALHO BIN PARA COMANDOS DE TERMINAL
[3] REPARAR APT
[4] INSTALAR POSINSTALL
" "criaPastaShareUser
" "AtalhoTerminalBin
" "repararApt
" "posInstall
" "return"
done