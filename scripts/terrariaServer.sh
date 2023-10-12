#!/usr/bin/env sh
terrariaServer(){

    installName="TerrariaServer"
    uninstallPastaAtalhoBinMesmoNome "$installName"
    criaDiretorioInstall "$dBashMenu/$installName"


    criaPastaBaixaExtrai "$diretorioInstall" "https://terraria.org/api/download/pc-dedicated-server/terraria-server-1449.zip" "ts.zip"
    chmod 770 $diretorioInstall/*/Linux/TerrariaServer.bin.x86_64
    criaArqRunDiretorioInstall "#!/usr/bin/env sh
cd $diretorioInstall/*/Linux
./TerrariaServer.bin.x86_64"
    criaAtalho "$installName" "Terraria Server PC" "bash run.sh" "$diretorioInstall" "true" "$installName" "$dBashMenu/Icons/default.svg"
    criaAtalhoBin "$diretorioInstall/run.sh" "$installName"

}   