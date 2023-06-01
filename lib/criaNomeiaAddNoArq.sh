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
#nomeDoArquivo "diretorio" "caracter que possui ex .jar"
#criarArq "seu texto aqui" "nomedoarquivo.txt"
#addNoArq "seu texto aqui" "nomedoarquivo.txt"