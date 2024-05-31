#!/usr/bin/env sh
mudaTexto(){
    sed -i 's/'"$1"'/'"$2"'/g' "$3"   
}
#mudaTexto "antigo" "novo" "diretorio/arquivo.txt"