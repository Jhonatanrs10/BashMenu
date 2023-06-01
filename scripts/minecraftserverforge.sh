#!/usr/bin/env sh
#Forges
verServerForge="https://maven.minecraftforge.net/net/minecraftforge/forge/1.7.10-10.13.4.1614-1.7.10/forge-1.7.10-10.13.4.1614-1.7.10-installer.jar"
verServerForge2="https://maven.minecraftforge.net/net/minecraftforge/forge/1.16.5-36.2.34/forge-1.16.5-36.2.34-installer.jar"
#mods
verMineLB="https://drive.google.com/u/0/uc?id=16yDUK00znMvOsLPEg6XBZbKCPTjK05ir&export=download"
verMinePixelmon="https://mediafilez.forgecdn.net/files/4110/761/Pixelmon-1.16.5-9.1.0-universal.jar"
mapEscadona="https://drive.google.com/u/0/uc?id=1l1WKskr8BlCBzRJkmxNQNoZfoB2Hn7mE&export=download"
installMinecraftServerForge(){

	echo -e "[INFO] - CRIANDO DIRETORIOS... - [INFO]"
	criaDiretorio "diretorioServer" "$dBashMenu/MinecraftServerForge"
    criaDiretorio "diretorioMods" "$dBashMenu/MinecraftServerForge/mods"
	
	echo -e "[INFO] - BAIXANDO ARQUIVOS... - [INFO]"
	baixaArq "diretorioNome" "$verServerForge" "$diretorioServer/server.jar"
    baixaArq "diretorioNome" "$verMineLB" "$diretorioMods/mod.jar"

	echo -e "[INFO] - INSTALANDO MINECRAFT SERVER - [INFO]"
	cd $diretorioServer

	java -jar server.jar --installServer

	addNoArq "eula=true" "eula.txt"

	addNoArq "online-mode=false
motd=\u00A71Jardim Recreio  \u00A77By Jhonatanrs
server-port=25565
enable-command-block=true" "server.properties"

    criarArq "#!/usr/bin/env bash
cd $diretorioServer
echo 'level-name=world' >> server.properties
echo 'EM CASO DE ERRO VERIFIQUE A VERSAO DO JAVA
Press ENTER'
read caso
java -jar forge*.jar nogui" "server.sh"

   criarArq "#!/usr/bin/env bash
cd $diretorioServer
echo 'level-name=escadona' >> server.properties
rm -r escadona
unrar x escadona.rar
java -jar forge*.jar nogui" "escadona.sh"

	baixaArq "diretorioNome" "$mapEscadona" "$diretorioServer/escadona.rar"

    criaAtalhoBin "$diretorioServer/server.sh" "MinecraftServerForge"
	criaAtalhoBin "$diretorioServer/escadona.sh" "EscadonaMinecraftServer"
	echo -e "[INFO] - SCRIPT FINALIZADO - [INFO]"
}