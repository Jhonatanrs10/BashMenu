#!/usr/bin/env sh
installMinecraft(){
	verMine="https://tlauncher.org/jar"
	uninstallPastaAtalhoBinMesmoNome "MinecraftTlauncher"
	echo -e "[INFO] - CRIANDO DIRETORIOS... - [INFO]"
	criaDiretorio "diretorioMine" "$dBashMenu/MinecraftTlauncher"
	echo -e "[INFO] - BAIXANDO ARQUIVOS... - [INFO]"
	baixaArq "diretorioNome" "$verMine" "$diretorioMine/tlauncher.zip"
    extrairArq "$diretorioMine"
	cd $diretorioMine
    tlauncher=`ls *.jar`
    criarArq "#!/usr/bin/env sh
	cd $diretorioMine
	java -jar $tlauncher" "$diretorioMine/tlauncher.sh"
    criaAtalho "MinecraftTlauncher" "Create your own world" "bash tlauncher.sh" "$diretorioMine" "false" "MinecraftTlauncher" "$dBashMenu/Icons/icon-minecraft.svg"
	criaAtalhoBin "$diretorioMine/tlauncher.sh" "MinecraftTlauncher"
	echo -e "[INFO] - SCRIPT FINALIZADO - [INFO]"
}