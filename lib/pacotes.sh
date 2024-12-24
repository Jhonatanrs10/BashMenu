#!/usr/bin/env sh
packagesManager(){
	clear
	echo "[PACKAGES]
[$1]	
Options: [1]Pacman, [2]Yay, [3]pamac, [4]Flatpak, [5]Apt
to uninstall for example a Pacman Package put [0] before option. Ex: [01]"
	read resp

	case $resp in
		1)sudo pacman -S $1 --needed;;
		2)yay -S $1 --needed;;
		3)sudo pamac install $1;;
		4)flatpak install $1;;
		5)sudo apt install $1;;
		01)for pacote in $1; do sudo pacman -R --noconfirm $pacote; done ;;
		02)for pacote in $1; do yay -R --noconfirm $pacote; done ;;
		03)for pacote in $1; do sudo pamac remove --no-confirm $pacote; done ;;
		04)for pacote in $1; do flatpak remove -y $pacote; done ;;
		05)for pacote in $1; do sudo apt remove -y $pacote; done ;;
		*)
	esac
	#sleep 5
}

repairPM(){
	echo "[REPAIR PACKAGES MANAGER]
Options: [1]Apt [2]Pacman"
	read resp
	case $resp in
		1)
			sudo dpkg --configure -a
			sudo apt --fix-broken install -y
			;;
		2)
			sudo rm /var/lib/pacman/db.lck
			;;
		*)
	esac
}
#packagesManager "apt1 apt2 apt3"
#repairPM
