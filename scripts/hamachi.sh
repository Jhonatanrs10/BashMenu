#!/usr/bin/env sh
hamachi="https://vpn.net/installers/logmein-hamachi_2.1.0.203-1_amd64.deb"
hamachi(){
	echo -e "[INFO] - CRIANDO DIRETORIOS... - [INFO]"
	criaDiretorio "diretorioApp" "$HOME/.Jhonatanrs/Hamachi"
	echo -e "[INFO] - BAIXANDO ARQUIVOS... - [INFO]"
	baixaArq "diretorio" "$hamachi" "$diretorioApp"
	echo -e "[INFO] - INSTALANDO HAMACHI - [INFO]"
	installDebs "$diretorioApp"
	rm -r $diretorioApp
	sleep 5
	sudo hamachi login
	sleep 5
	echo -e "seu E-mail Hamachi"
	read email
	sudo hamachi attach $email
	sleep 5
	sudo hamachi set-nick LINUX
	sudo hamachi create jardimrecreio 123
	sleep 5
	sudo hamachi create jardimrecreio2 123
	sudo add-apt-repository -y ppa:ztefn/haguichi-stable
	sudo apt update
	sudo apt install -y haguichi
}