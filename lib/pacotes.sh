#!/usr/bin/env sh
installPacotes(){
	resp="vazio"
	echo "[INSTALAR PACOTES] $2
Pacotes: $1	
Usar: [1]apt, [2]pacman [3]pamac [4]flatpak"
	read resp
	PROGRAMAS_PARA_INSTALAR=($1)
	for nome_do_programa in ${PROGRAMAS_PARA_INSTALAR[@]}; 
	do
		if [ "$resp" = 1 ]; then
			sudo apt --fix-broken install -y
	    	sudo apt install "$nome_do_programa" -y
		elif [ "$resp" = 2 ]; then
			sudo pacman -S "$nome_do_programa" --noconfirm
		elif [ "$resp" = 3 ]; then
			sudo pamac install "$nome_do_programa" --no-confirm
		elif [ "$resp" = 4 ]; then
			flatpak install "$nome_do_programa"
		fi
	done 
}

removePacotes(){
	echo -e "[INFO] - INSTALANDO PROGRAMAS - [INFO]"
	resp="vazio"
	clear
	echo "[REMOVER PACOTES] 
Pacotes: $1	
Usar: [1]apt, [2]pacman [3]pamac [4]flatpak"
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
		elif [ "$resp" = 3 ]; then
			sudo pamac remove "$nome_do_programa" --no-confirm
		elif [ "$resp" = 4 ]; then
			flatpak uninstall "$nome_do_programa"
		fi
	done 
}

repararApt(){
	sudo dpkg --configure -a
	sudo apt --fix-broken install -y
}

repararPacman(){
	sudo rm /var/lib/pacman/db.lck
}
#installPacotes"apt1 apt2 apt3"
#removePacotes "apt1 apt2 apt3"
#repararApt
#repararPacman