#!/usr/bin/env sh
removeAtalhoBin(){
    if [ $1 = '' ]; then
        echo "NAO COLOQUE UM VALOR VAZIO RISCO DE QUEBRAR O SISTEMA"
    else
        sudo rm /usr/bin/jrs-$1
    fi
}
#removeAtalhoBin "nome do atalho na pasta /usr/bin/ sempre deixar esse campo preenchido pra nao apagar a pasta bin"