#!/usr/bin/env sh
mexeArq(){
    for arq in `ls $1`
    do
        if [[ $arq =~ .*$3.* ]]; then
            $2 $1$arq $4
        fi
    done
}
#mexeArq "$diretorioInstall" "comandoantesdoarquivo" "palavrachaveexemplomesmo.txt" "comandodepoisdoarquivo"