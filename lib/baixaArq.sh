#!/usr/bin/env sh
baixaArq(){
    if [ $1 = 'diretorio' ]; then
        wget -c -P "$3" "$2"
    elif [ $1 = 'diretorioNome' ]; then
        wget -c "$2" -O "$3"
    fi 
}
#baixaArq "diretorioNome Ou diretorio" "links" "diretorio/Nome.tar"
