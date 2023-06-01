#!/usr/bin/env sh
installMinecraftServerVersion(){
	nomeMSV="Teste"
	echo "NOME DO SERVIDOR/PASTA/BIN (SERA USADO NOS 3)"
	read nomeMSV
	#Forges
	echo "=====================
Servers Links:
=====================
FORGE 1.16.5
https://maven.minecraftforge.net/net/minecraftforge/forge/1.16.5-36.2.34/forge-1.16.5-36.2.34-installer.jar

FORGE 1.7.10
https://maven.minecraftforge.net/net/minecraftforge/forge/1.7.10-10.13.4.1614-1.7.10/forge-1.7.10-10.13.4.1614-1.7.10-installer.jar

MOHISTMC 1.16.5
https://mohistmc.com/builds/1.16.5/mohist-1.16.5-1107-server.jar
"
	echo "COLE O LINK DE DOWNLOAD DO SERVER"
	read varServer
	#Mods
	echo "=====================
Mods Links:
=====================

LuckyBlock 1.7.10
https://drive.google.com/u/0/uc?id=16yDUK00znMvOsLPEg6XBZbKCPTjK05ir&export=download

PixelMon 1.16.5
https://mediafilez.forgecdn.net/files/4110/761/Pixelmon-1.16.5-9.1.0-universal.jar
"	
	echo "COLE O LINK DE DOWNLOAD DO MOD"
	read varMods
	#Plugins
	echo "=====================
Plugins Links:
=====================

WORLD EDIT 1.16.5
https://mediafilez.forgecdn.net/files/4162/208/worldedit-mod-7.2.13.jar

VAULT 1.16.5
https://www.spigotmc.org/resources/vault.34315/download?version=344916

SKYWARS RELOADED 1.16.5
https://www.spigotmc.org/resources/skywarsreloaded.3796/download?version=263166


"	
	echo "COLE O LINK DE DOWNLOAD DO PLUGIN"
	read varPlugins

	echo -e "[INFO] - CRIANDO DIRETORIOS... - [INFO]"
	criaDiretorio "diretorioServer" "$HOME/.Jhonatanrs/MinecraftServer-$nomeMSV"
    criaDiretorio "diretorioMods" "$HOME/.Jhonatanrs/MinecraftServer-$nomeMSV/mods"
	criaDiretorio "diretorioPlugins" "$HOME/.Jhonatanrs/MinecraftServer-$nomeMSV/plugins"

	echo -e "[INFO] - BAIXANDO ARQUIVOS... - [INFO]"
	criaPastaBaixaExtrai "$diretorioServer/" "$varServer" "server.jar"
	criaPastaBaixaExtrai "$diretorioMods/" "$varMods" "mod.jar"
	criaPastaBaixaExtrai "$diretorioPlugins/" "$varPlugins" "plugin.jar"

	echo -e "[INFO] - INSTALANDO MINECRAFT SERVER - [INFO]"
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