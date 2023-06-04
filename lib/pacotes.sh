#!/usr/bin/env sh
installPacotes(){
	echo -e "[INFO] - INSTALANDO PROGRAMAS - [INFO]"
	resp="vazio"
	clear
	echo "[INSTALAR PACOTES] Qual gerenciador de pacotes deseja usar? [apt,pacman]"
	read resp
	PROGRAMAS_PARA_INSTALAR=($1)
	for nome_do_programa in ${PROGRAMAS_PARA_INSTALAR[@]}; 
	do
		if [ "$resp" = "apt" ]; then
			sudo apt --fix-broken install -y
	    	sudo apt install "$nome_do_programa" -y
		elif [ "$resp" = "pacman" ]; then
			sudo pacman -S "$nome_do_programa" --noconfirm
		else
			resp="error"
		fi
	done 
	if [ "$resp" = "error" ]; then
		clear
		echo "[ERRO] Nenhum gerenciador encontrado!"
		sleep 1
	fi
}

removePacotes(){
	echo -e "[INFO] - INSTALANDO PROGRAMAS - [INFO]"
	resp="vazio"
	clear
	echo "Qual gerenciador de pacotes deseja usar? [apt,pacman]"
	read resp
	PROGRAMAS_PARA_INSTALAR=($1)
	for nome_do_programa in ${PROGRAMAS_PARA_INSTALAR[@]}; 
	do
		if [ "$resp" = "apt" ]; then
			#sudo apt --fix-broken install -y
	    	sudo apt remove "$nome_do_programa" -y
        	#sudo apt autoremove "$nome_do_programa" -y
        	#sudo apt purge "$nome_do_programa" -y
		elif [ "$resp" = "pacman" ]; then
			sudo pacman -R "$nome_do_programa" --noconfirm
		else
			resp="error"
		fi
	done 
    if [ "$resp" = "error" ]; then
		clear
		echo "[ERRO] Nenhum gerenciador encontrado!"
		sleep 5
	fi
}

repararApt(){
	sudo dpkg --configure -a
	sudo apt --fix-broken install -y
}
#installPacotes"apt1 apt2 apt3"
#removePacotes "apt1 apt2 apt3"
#repararApt