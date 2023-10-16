#!/usr/bin/env sh
criaArqRunDiretorioInstall(){
    criaDiretorio "shortcuts" "$dBashMenu/Shortcuts"
    echo -e 'DIGITE O DIRETORIO Ex:Downloads
$HOME/'
    read nesseDir
    echo 'DIGITE UM NOME PARA O ATALHO'
    read nomeDir
    criaLinkSym "$HOME/$nesseDir" "$shortcuts/$nomeDir"
}   