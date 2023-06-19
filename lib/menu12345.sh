#!/usr/bin/env sh
menu12345(){
    resp="VAZIO"
    while [ "$resp" != "" ];
    do 
        clear
        echo -e "$1"
        echo -e "PRESS ENTER PARA SAIR OU IR PARA OUTRA PARTE DO MENU. PRESS [exit] PARA FECHAR"
        read resp
        if [ "$resp" = 1 ]; then
            clear
            $2
            return
        elif [ "$resp" = 2 ]; then
            clear
            $3
            return   
        elif [ "$resp" = 3 ]; then
            clear
            $4
            return 
        elif [ "$resp" = 4 ]; then
            clear
            $5
            return 
        elif [ "$resp" = 5 ]; then
            clear
            $6
            return 
        elif [ "$resp" = "exit" ]; then
            clear
            exit 1
        fi
    done
}
#menu pra manipular libs e scripts
#menu12345 "texto" "comando se 1" "comando se 2" "comando se 3" "comando se 4" "comando se 5"

#MODELO
#menu12345 "
#[1] opcao 1
#[2] opcao 2
#[3] opcao 3
#[4] opcao 4
#[5] opcao 5
#" "return
#" "return
#" "return
#" "return
#" "return"