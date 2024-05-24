#!/usr/bin/env sh
criarArq(){
	echo "$1" > $2
}
nomeDoArquivo(){
    cd $1
    return `ls *$2*`
}
addNoArq(){
	echo "$1" >> $2
}

criarArqv2(){
    cat <<REALEND > $2
$1
REALEND
}
#nomeDoArquivo "diretorio" "caracter que possui ex .jar"
#criarArq "seu texto aqui" "nomedoarquivo.txt"
#addNoArq "seu texto aqui" "nomedoarquivo.txt"
#criarArqv2 "seu texto aqui" "diretorio/nomedoarquivo.txt"