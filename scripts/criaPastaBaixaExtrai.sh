#!/usr/bin/env sh
source ./lib/criaDiretorio.sh
source ./lib/baixaArq.sh
source ./lib/extrairArq.sh
criaPastaBaixaExtrai(){
    criaDiretorio "bac" "$1"
    baixaArq "diretorioNome" "$2" "$1/$3"
    extrairArq "$bac" 
}
#criaPastaBaixaExtrai "$HOME/.diretorio" "Link" "mod.jar"