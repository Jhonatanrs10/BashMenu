#!/usr/bin/env sh
criaPastaShareUser(){
	installPacotes "samba"
        enableSystemctl "smb"
        criaDiretorioShare "$HOME/Share" "Share" "no"
}

criaPastaShareGuest(){
	installPacotes "samba"
        enableSystemctl "smb"
        criaDiretorioShare "/srv/samba/guest" "Guest" "yes"
}
