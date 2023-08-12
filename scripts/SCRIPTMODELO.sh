#!/usr/bin/env sh
SCRIPTMODELO(){
    installName="SCRIPTMODELO"
    uninstallPastaAtalhoBinMesmoNome "$installName"
    criaDiretorioInstall "$dBashMenu/$installName"
    criaAtalho "$installName" "Description" "bash run.sh" "$diretorioServer" "false" "$installName" "$dBashMenu/Icons/default.svg"
    criaAtalhoBin "$diretorioServer/run.sh" "$installName"

}   