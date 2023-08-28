#!/usr/bin/env sh
criaPastaShareUser(){
	installPacotes "samba"
        enableSystemctl "smb"
        criaDiretorioShare "$HOME/Share" "Share" "no"
}

criaPastaShareUser2(){
	installPacotes "samba"
        enableSystemctl "smb"
        criaDiretorioShare "$HOME/Share" "TesteShare" "yes"
}

criaPastaShareGuest(){
	installPacotes "samba"
        enableSystemctl "smb"
        criaDiretorioShare "/samba/guest" "Guest" "yes"
}
