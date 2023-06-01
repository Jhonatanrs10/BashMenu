#!/usr/bin/env sh
uninstallPastaAtalhoBin(){
    if [ $2 = '' ]; then
        echo "NAO COLOQUE UM VALOR VAZIO RISCO DE QUEBRAR O SISTEMA"
    else
        sudo rm -r $1 
	    sudo rm /usr/share/applications/$2
        sudo rm /usr/bin/jrs-$3
    fi
}
#remove .desktop, atalho no bin e pasta
#uninstallPastaAtalhoBin "$HOME/.Jhonatanrs/pasta" "nomedoarquivo.desktop" "atalho na pasta /usr/bin/"