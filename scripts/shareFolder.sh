#!/usr/bin/env sh
criaPastaShareUser(){
	installPacotes "samba"
        criaSeuUsuarioSamba
        criaDiretorioShare "$HOME/Share" "Share"
}
