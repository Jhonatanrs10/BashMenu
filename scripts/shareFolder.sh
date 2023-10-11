#!/usr/bin/env sh
criaPastaShareUser(){
	installPacotes "samba"
        enableSystemctl "smb"
        enableSystemctl "nmb"
        criaSeuUsuarioSamba
        criaSmbDefault
        criaDiretorioShare "$HOME/Samba/User" "User" "no"
}

criaPastaShareGuest(){
	installPacotes "samba"
        enableSystemctl "smb"
        enableSystemctl "nmb"
        criaSeuUsuarioSamba
        criaSmbDefault
        criaDiretorioShare "/home/samba" "Guest" "yes"
        ln -s /home/samba $HOME/Samba/Guest
}
#sudo useradd -m samba
#sudo passwd samba