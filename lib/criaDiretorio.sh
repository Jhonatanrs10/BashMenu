#!/usr/bin/env sh
criaDiretorioInstall(){
    export diretorioInstall="$1"
    mkdir -p $diretorioInstall
    cd $diretorioInstall
}
criaDiretorio(){
    export $1="$2"
    mkdir -p $2
}
#criaDiretorioInstall "$HOME/.diretorio"
#criaDiretorio "nomedavariavel" "$HOME/.diretorio"