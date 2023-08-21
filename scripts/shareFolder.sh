#!/usr/bin/env sh
criaPastaShareUser(){
	installPacotes "samba"
        enableSystemctl "smb"
        criaSeuUsuarioSamba
        criaDiretorioShare "$HOME/Share" "Share" "no"
}

criaPastaShareGuest(){
	installPacotes "samba"
        enableSystemctl "smb"
        criaSeuUsuarioSamba
        criaDiretorioShare "/srv/samba/guest" "Guest" "yes"
}
