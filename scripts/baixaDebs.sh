#!/usr/bin/env sh
baixaDebs(){
    criaDiretorio "diretorioBaixaDebs" "$dBashMenu/tempArqs"
    clear
    echo -e "[BashMenu] Deseja baixar $1? [s/n]"
    read resp
    if [ "$resp" = s ]; then
        baixaArq "diretorioNome" "$2" "$diretorioBaixaDebs/$1.deb"
    fi
}
#baixaDebs "Nomedoapp" "linkdodeb"