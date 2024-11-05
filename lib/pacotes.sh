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
		01)sudo pacman -R $1;;
		02)yay -R $1;;
		03)sudo pamac remove $1;;
		04)flatpak remove $1;;
		05)sudo apt remove $1;;
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
