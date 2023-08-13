#!/usr/bin/env sh
SCRIPTMODELO(){

    installName="SCRIPTMODELO"
    uninstallPastaAtalhoBinMesmoNome "$installName"
    criaDiretorioInstall "$dBashMenu/$installName"


    #criaPastaBaixaExtrai "$diretorioInstall" "Link" "mod.jar"


    criaAtalho "$installName" "Description" "bash run.sh" "$diretorioInstall" "false" "$installName" "$dBashMenu/Icons/default.svg"
    criaAtalhoBin "$diretorioInstall/run.sh" "$installName"

}   