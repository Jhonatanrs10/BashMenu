#!/usr/bin/env sh
installMinecraftServerVersion(){
	echo "NOME DO SERVIDOR/PASTA/BIN (SERA USADO NOS 3)"
	read nomeMSV

	yesorno "MINECRAFT SERVER FORGE 1.7.10" "setLink https://maven.minecraftforge.net/net/minecraftforge/forge/1.7.10-10.13.4.1614-1.7.10/forge-1.7.10-10.13.4.1614-1.7.10-installer.jar"
	yesorno "MINECRAFT SERVER FORGE 1.16.5" "setLink https://maven.minecraftforge.net/net/minecraftforge/forge/1.16.5-36.2.34/forge-1.16.5-36.2.34-installer.jar"
	yesorno "MINECRAFT SERVER MOHIST 1.16.5" "setLink https://mohistmc.com/builds/1.16.5/mohist-1.16.5-1107-server.jar"
	yesorno "MINECRAFT SERVER FORGE 1.18.2" "setLink https://maven.minecraftforge.net/net/minecraftforge/forge/1.18.2-40.2.0/forge-1.18.2-40.2.0-installer.jar"

	echo -e "[INFO] - CRIANDO DIRETORIOS... - [INFO]"
	criaDiretorio "diretorioServer" "$HOME/.Jhonatanrs/MinecraftServer-$nomeMSV"

	echo -e "[INFO] - BAIXANDO ARQUIVOS... - [INFO]"
	criaPastaBaixaExtrai "$diretorioServer/" "$varLink" "server.jar"

	echo -e "[INFO] - INSTALANDO - [INFO]"
	cd $diretorioServer
	java -jar server.jar --installServer
	
	addNoArq "eula=true" "eula.txt"

	addNoArq "online-mode=false
motd=\u00A71$nomeMSV  \u00A77By Jhonatanrs
server-port=25565
enable-command-block=true" "server.properties"

	echo "PALAVRA CHAVE DO EXECUTAVEL JAR. EXEMPLO: server; forge."
	read serverJar

    criarArq "#!/usr/bin/env bash
cd $diretorioServer
echo 'level-name=world' >> server.properties
echo 'EM CASO DE ERRO VERIFIQUE A VERSAO DO JAVA
Press ENTER'
read caso
java -jar $serverJar*.jar nogui" "server.sh"
    
	criaAtalhoBin "$diretorioServer/server.sh" "$nomeMSV-MinecraftServer"
	echo -e "[INFO] - SCRIPT FINALIZADO - [INFO]"
}