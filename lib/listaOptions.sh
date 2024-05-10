#!/usr/bin/env sh
listaOptions(){
    zListaOptions="/tmp/zListaOptions.txt"
    cd $1
    ls .> $zListaOptions
    cd $OLDPWD
    echo "[ListaOptions] DIGITE O NUMERO DA SUA ESCOLHA:"
    cat -n $zListaOptions
    echo "[ListaOptions]"
    read zLOption
    #pega conteudo do arquivo | numera o conteudo por linha | escolhe uma linha | elimina o numero da linha e deixa so o conteudo
    export $2=$(cat $zListaOptions | grep -n ^| grep ^$zLOption | cut -d: -f2)
}

echoRead(){
    echo $1
    read $2
}
#echoRead "MSG" "VAR RETORNO"
#listaOptions "/home/user/diretorio" "nome-variavel-retorno"