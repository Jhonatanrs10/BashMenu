#!/usr/bin/env sh
fullPackages="git imagemagick net-tools zip unzip rar unrar tar bzip2 bash bats curl jq nano wget"
javaPackages="openjdk-8-jdk openjdk-11-jdk openjdk-17-jdk jre8-openjdk-headless jre8-openjdk jdk8-openjdk openjdk8-doc openjdk8-src jre11-openjdk-headless jre11-openjdk jdk11-openjdk openjdk11-doc openjdk11-src jre-openjdk-headless jre-openjdk jdk-openjdk openjdk-doc openjdk-src"
dBashMenu="$HOME/.bashmenu"
nomeRun="run"
DATANOW=$(date "+[%d-%m-%Y][%H-%M]")
dependencias(){
    source ./lib/sourceFolder.sh
    sourceFolder "LIBs" "./lib"
    sourceFolder "Scripts" "./scripts"
    echo "INSTALAR DEPENDENCIAS? TECLE s PARA ACEITAR"
    read resp
    if [ "$resp" = "s" ]; then
        mkdir -p $dBashMenu/Bins
        criarArq "#!/usr/bin/env sh
cd $PWD
bash $nomeRun.sh" "$dBashMenu/Bins/runBashMenu.sh"
        AtalhoBinExec "$dBashMenu/Bins/runBashMenu.sh"
        criaAtalho "BashMenu" "My BashMenu " "jrs" "$dBashMenu" "true" "BashMenu" "$dBashMenu/Icons/logojrs.svg"
        packIcons
        installPacotes "$fullPackages"
        installPacotes "$javaPackages"
    fi
}


