#!/usr/bin/env sh
dBashMenu="$HOME/.bashmenu"
nomeRun="run"
DATANOW=$(date "+[%d-%m-%Y][%H-%M]")
dependencias(){
    source ./lib/sourceFolder.sh
    sourceFolder "LIBs" "./lib"
    sourceFolder "Scripts" "./scripts"
    #sleep 10
}
dependenciasAtalho(){
    echo "INSTALAR ATALHO BASHMENU 
Diretorio atual:
$PWD
Este e o diretorio do $nomeRun.sh (s/n)"
    read resp
    if [ "$resp" = "s" ]; then
        mkdir -p $dBashMenu/Bins
        criarArq "#!/usr/bin/env sh
cd $PWD
bash $nomeRun.sh" "$dBashMenu/Bins/runBashMenu.sh"
        AtalhoBinExec "$dBashMenu/Bins/runBashMenu.sh"
    fi
}


