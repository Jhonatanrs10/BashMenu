#!/usr/bin/env sh
criaPastaShareUser(){
	installPacotes "samba"
        sudo systemctl enable smb.service
        sudo systemctl start smb.service --now
        criaSeuUsuarioSamba
        criaDiretorioShare "$HOME/Share" "Share"
}
