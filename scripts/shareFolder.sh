#!/usr/bin/env sh
criaPastaShareUser(){
	installPacotes "samba"
        enableSystemctl "smb"
        criaSeuUsuarioSamba
        criaDiretorioShare "$HOME/Share" "Share"
}
