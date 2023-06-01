#!/usr/bin/env sh
criaPastaShareUser(){
	installApt "samba"
        criaSeuUsuarioSamba
        criaDiretorioShare "$HOME/Share" "Share"
}
