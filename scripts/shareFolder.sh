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
#sudo useradd -m samba
#sudo passwd samba