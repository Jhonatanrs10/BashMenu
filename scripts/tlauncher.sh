#!/usr/bin/env sh
verMine="https://tlauncher.org/jar"
installMinecraft(){
	echo -e "[INFO] - CRIANDO DIRETORIOS... - [INFO]"
	criaDiretorio "diretorioMine" "$HOME/.Jhonatanrs/MinecraftTlauncher"
	echo -e "[INFO] - BAIXANDO ARQUIVOS... - [INFO]"
	baixaArq "diretorioNome" "$verMine" "$diretorioMine/tlauncher.zip"
    extrairArq "$diretorioMine"
	cd $diretorioMine
    tlauncher=`ls *.jar`
    criarArq "#!/usr/bin/env sh
	cd $diretorioMine
	java -jar $tlauncher" "$diretorioMine/tlauncher.sh"
    criaAtalho "Minecraft" "Create your own world" "bash tlauncher.sh" "$diretorioMine" "false" "MinecraftTlauncher" "$HOME/.Jhonatanrs/Icons/icon-minecraft.svg"
	criaAtalhoBin "$diretorioMine/tlauncher.sh" "MinecraftTlauncher"
	echo -e "[INFO] - SCRIPT FINALIZADO - [INFO]"
}