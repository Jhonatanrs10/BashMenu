#!/usr/bin/env sh
installApt(){
	echo -e "[INFO] - INSTALANDO PROGRAMAS NO APT - [INFO]"
    sudo apt --fix-broken install -y
	PROGRAMAS_PARA_INSTALAR=($1)
	for nome_do_programa in ${PROGRAMAS_PARA_INSTALAR[@]}; 
	do
	    sudo apt install "$nome_do_programa" -y
		sudo pacman -S "$nome_do_programa" --noconfirm
	done 
    sleep 5
}
removeApt(){
	echo -e "[INFO] - INSTALANDO PROGRAMAS NO APT - [INFO]"
    sudo apt --fix-broken install -y
	PROGRAMAS_PARA_INSTALAR=($1)
	for nome_do_programa in ${PROGRAMAS_PARA_INSTALAR[@]}; 
	do
	    sudo apt remove "$nome_do_programa" -y
        sudo apt autoremove "$nome_do_programa" -y
        sudo apt purge "$nome_do_programa" -y
		sudo pacman -R "$nome_do_programa" --noconfirm
	done 
    sleep 5
}

repararApt(){
	sudo dpkg --configure -a
}
#installApt "apt1 apt2 apt3"
#removeApt "apt1 apt2 apt3"
#repararApt