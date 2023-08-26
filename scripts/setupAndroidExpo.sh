#!/usr/bin/env sh

setupAndroidExpo(){
    installPacotes "nodejs npm"
    yesorno "INSTALAR EXPO-CLI" "sudo npm install expo-cli --global"
    criaDiretorioInstall "$HOME/AndroidExpo"
    echo "INICIAR UM PROJETO
expo init NOME-PROJETO
ENTRAR NA PASTA DO PROJETO
cd NOME-PROJETO
INICIAR O PROJETO
expo start "
}

criarProjetoExpo(){
    cd $HOME/AndroidExpo 
    echo "NOME DO PROJETO:"
    read pName
    expo init $pName
    cd $pName
    yesorno "EXPO START" "expo start"
}