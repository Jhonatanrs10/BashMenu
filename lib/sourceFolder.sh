#!/usr/bin/env sh
sourceFolder(){
    #recho "=====$1====="
    for src in `ls $2`; do
        source $2/$src
        #echo "source $src"
    done
}
# . representa a pasta raiz atual
#colocar somente um diretorio
#sourceFolder "titulo um echo" "diretorio exemplos ./lib ./scripts"