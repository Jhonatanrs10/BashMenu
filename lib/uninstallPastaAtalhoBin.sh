#!/usr/bin/env sh
uninstallPastaAtalhoBin(){
    uninstallApplica="n"
    echo "Uninstall $1 [s/n]"
    read uninstallApplica
    if [ $uninstallApplica = "s" ]; then
        if [ $2 = '' ]; then
            echo "NAO COLOQUE UM VALOR VAZIO RISCO DE QUEBRAR O SISTEMA"
        else
            sudo rm -r $1 
            sudo rm /usr/share/applications/jrs-$2
            sudo rm /usr/bin/jrs-$3
        fi
        exit 1
    fi
    echo "..."
}

uninstallPastaAtalhoBinMesmoNome(){
    uninstallPastaAtalhoBin "$dBashMenu/$1" "$1.desktop" "$1" 
}

#remove .desktop, atalho no bin e pasta
#uninstallPastaAtalhoBin "$HOME/.Jhonatanrs/pasta" "nomedoarquivo.desktop" "atalho na pasta /usr/bin/"
#uninstallPastaAtalhoBinMesmoNome "Nome igual em Pasta, Atalho e Bin"