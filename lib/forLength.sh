#!/usr/bin/env sh
forLength(){
    echo $1
    read txtForLength
    if [ "$txtForLength" = "" ]; then
            txtForLength=$3
            echo "Valor vazio, Default $txtForLength"
    elif [ "`expr length $txtForLength`" = $2 ]; then
            echo "Escolha $txtForLength"
    else
            txtForLength=$3
            echo "Necessario 6 digitos, Default $txtForLength"    
    fi
}
#forLength "Titulo" "numero/tamanho/length" "default value"