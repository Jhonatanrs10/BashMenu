#!/usr/bin/env sh
criaPastaBaixaExtrai(){
    criaDiretorio "bac" "$1"
    baixaArq "diretorioNome" "$2" "$1/$3"
    extrairArq "$bac" 
}
#criaPastaBaixaExtrai "$HOME/.diretorio" "Link" "mod.jar"
