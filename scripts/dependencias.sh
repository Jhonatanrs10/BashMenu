#!/usr/bin/env sh
packagesapt="openjdk-8-jdk openjdk-11-jdk openjdk-17-jdk git imagemagick net-tools zip unzip rar unrar tar bzip2 bash bats curl jq"
packagespacman="jre8-openjdk-headless jre8-openjdk jdk8-openjdk openjdk8-doc openjdk8-src jre11-openjdk-headless jre11-openjdk jdk11-openjdk openjdk11-doc openjdk11-src jre-openjdk-headless jre-openjdk jdk-openjdk openjdk-doc openjdk-src"
dBashMenu="$HOME/.Jhonatanrs"
dependencias(){
    source ./lib/sourceFolder.sh
    sourceFolder "LIBs" "./lib"
    sourceFolder "Scripts" "./scripts"
    echo "INSTALAR DEPENDENCIAS? TECLE s PARA ACEITAR"
    read resp
    if [ "$resp" = "s" ]; then
    criaDiretorio "dBashMenu" "$HOME/.Jhonatanrs"
    criarArq "#!/usr/bin/env sh
cd $PWD
bash BashMenu.sh" "$dBashMenu/BashMenu.sh"
    removeAtalhoBin "BashMenu"
    criaAtalhoBin "$dBashMenu/BashMenu.sh" "BashMenu"
    packIcons
    installApt "$packagesapt"	
    installApt "$packagespacman"    
	fi
}


