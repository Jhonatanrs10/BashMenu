#!/usr/bin/env sh
installPacotes(){
	echo -e "[INFO] - INSTALANDO PROGRAMAS - [INFO]"
	resp="vazio"
	clear
	echo "[INSTALAR PACOTES] 
Pacotes: $1	
Usar: [1]apt, [2]pacman"
	read resp
	PROGRAMAS_PARA_INSTALAR=($1)
	for nome_do_programa in ${PROGRAMAS_PARA_INSTALAR[@]}; 
	do
		if [ "$resp" = 1 ]; then
			sudo apt --fix-broken install -y
	    	sudo apt install "$nome_do_programa" -y
		elif [ "$resp" = 2 ]; then
			sudo pacman -S "$nome_do_programa" --noconfirm
		fi
	done 
}

removePacotes(){
	echo -e "[INFO] - INSTALANDO PROGRAMAS - [INFO]"
	resp="vazio"
	clear
	echo "[REMOVER PACOTES] 
Pacotes: $1	
Usar: [1]apt, [2]pacman"
	read resp
	PROGRAMAS_PARA_INSTALAR=($1)
	for nome_do_programa in ${PROGRAMAS_PARA_INSTALAR[@]}; 
	do
		if [ "$resp" = 1 ]; then
			#sudo apt --fix-broken install -y
	    	sudo apt remove "$nome_do_programa" -y
        	#sudo apt autoremove "$nome_do_programa" -y
        	#sudo apt purge "$nome_do_programa" -y
		elif [ "$resp" = 2 ]; then
			sudo pacman -R "$nome_do_programa" --noconfirm
		fi
	done 
}

repararApt(){
	sudo dpkg --configure -a
	sudo apt --fix-broken install -y
}
#installPacotes"apt1 apt2 apt3"
#removePacotes "apt1 apt2 apt3"
#repararApt