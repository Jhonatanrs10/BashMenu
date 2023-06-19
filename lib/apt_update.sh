#!/usr/bin/env sh
apt_update(){
	echo -e "[INFO] - ATUALIZANDO REPOSITORIO E FAZENDO ATUALIZACAO DO SISTEMA - [INFO]"
	sudo apt update && sudo apt dist-upgrade -y
	sudo pacman -Syyuu
}