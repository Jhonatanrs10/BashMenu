#!/usr/bin/env sh
SCRIPTMODELO(){

    installName="SCRIPTMODELO"
    uninstallPastaAtalhoBinMesmoNome "$installName"
    criaDiretorioInstall "$dBashMenu/$installName"

    #criaPastaBaixaExtrai "$diretorioInstall" "Link" "mod.jar"

    #entra em pasta * pega arquivos * e move uma pasta atras .  
    #mv */* .

    #criaArqRunDiretorioInstall "#!/usr/bin/env sh
#cd $diretorioInstall
#./nomearquivo"

    criaAtalho "$installName" "Description" "bash run.sh" "$diretorioInstall" "false" "$installName" "application-default-icon"
    criaAtalhoBin "$diretorioInstall/run.sh" "$installName"

}   