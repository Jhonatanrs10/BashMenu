#!/usr/bin/env sh
installMinecraftServer(){
	link="https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar"

	echo -e "[INFO] - CRIANDO DIRETORIOS... - [INFO]"
	criaDiretorioInstall "$dBashMenu/MinecraftServer"

	echo -e "[INFO] - BAIXANDO ARQUIVOS... - [INFO]"
	baixaArq "diretorioNome" "$link" "$diretorioInstall/server.jar"

	echo -e "[INFO] - INSTALANDO - [INFO]"

	java -jar server.jar nogui

	addNoArq "eula=true" "eula.txt"

	addNoArq "online-mode=false
motd=\u00A71Jardim Recreio  \u00A77By Jhonatanrs
server-port=25565
enable-command-block=true" "server.properties"

    criarArq "#!/usr/bin/env bash
echo 'EM CASO DE ERRO VERIFIQUE A VERSAO DO JAVA
Press ENTER'
read caso
cd $diretorioInstall
java -jar server.jar nogui" "server.sh"

    criaAtalhoBin "$diretorioInstall/server.sh" "MinecraftServer"
	echo -e "[INFO] - SCRIPT FINALIZADO - [INFO]"
}