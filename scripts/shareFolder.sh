#!/usr/bin/env sh
criaPastaShareUser(){
        criaSmbDefault
	packagesManager "samba"
        enableSystemctl "smb"
        enableSystemctl "nmb"
        criaSeuUsuarioSamba
        criaDiretorioSamba
        criaDiretorioShare "$HOME/Samba/User" "User" "no"
        
}

criaPastaShareGuest(){
        criaSmbDefault
	packagesManager "samba"
        enableSystemctl "smb"
        enableSystemctl "nmb"
        criaSeuUsuarioSamba
        criaDiretorioSamba
        criaDiretorioShare "/home/samba" "Guest" "yes"
        ln -s /home/samba $HOME/Samba/Guest
}

setupSamba(){
        echo "[Setup Samba]
Options: [1]Yes [2]No"
	read resp
        case $resp in
        1)criaSmbDefault
        packagesManager "samba"
        enableSystemctl "smb"
        enableSystemctl "nmb"
        criaSeuUsuarioSamba
        criaDiretorioSamba
        criaDiretorioShare "$HOME/Samba/User" "User" "no"
        criaDiretorioShare "/home/samba" "Guest" "yes"
        ln -s /home/samba $HOME/Samba/Guest
        ;;
        *)
        esac
}
#sudo useradd -m samba
#sudo passwd samba