#!/usr/bin/env sh
criaArqRunDiretorioInstall(){
    criaDiretorio "shortcuts" "$dBashMenu/Shortcuts"
    echo -e 'DIGITE O DIRETORIO OU DIRETORIO/ARQUIVO.EXTENSION Ex:/home/user/Downloads Ou /home/user/teste.txt'
    read nesseDir
    echo 'DIGITE UM NOME PARA O ATALHO'
    read nomeDir
    criaLinkSym "$nesseDir" "$shortcuts/$nomeDir"
}   