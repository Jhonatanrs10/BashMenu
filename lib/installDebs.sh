#!/usr/bin/env sh
installDebs(){
	echo -e "[INFO] - INSTALANDO PACOTES DEB - [INFO]"
	sudo dpkg -i $1/*.deb
}
#installDebs "$diretorioInstall"