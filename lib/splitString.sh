#!/usr/bin/env sh
splitString(){
    str=$1
    echo ${str:$2:$3}
    
}
#splitString "eu sou o jhonatan" "9" "-4"
#mostra os caracteres entre os 9 primeiros e 4 ultimos ou seja  'jhon'
#splitString "eu sou o jhonatan" "2" "5"
#mostra os 5 caracteres apos o 2 ' sou '
