#!/usr/bin/env sh
menu12345(){
    resp="VAZIO"
    while [ "$resp" != "" ];
    do 
        clear
        echo -e "$1"
        echo -e "PRESS ENTER PARA SAIR OU IR PARA OUTRA PARTE DO MENU."
        read resp
        if [ "$resp" = 1 ]; then
            clear
            $2
            exit 1
        elif [ "$resp" = 2 ]; then
            clear
            $3
            exit 1   
        elif [ "$resp" = 3 ]; then
            clear
            $4
            exit 1  
        elif [ "$resp" = 4 ]; then
            clear
            $5
            exit 1  
        elif [ "$resp" = 5 ]; then
            clear
            $6
            exit 1  
        fi
    done
}
#menu pra manipular libs e execucao
#menu12345 "texto" "comando se 1" "comando se 2" "comando se 3" "comando se 4" "comando se 5"