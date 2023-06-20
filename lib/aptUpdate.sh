#!/usr/bin/env sh
aptUpdate(){
	echo -e "[INFO] - ATUALIZANDO REPOSITORIO E FAZENDO ATUALIZACAO DO SISTEMA - [INFO]"
	sudo apt update && sudo apt dist-upgrade -y
	sudo pacman -Syyuu
}