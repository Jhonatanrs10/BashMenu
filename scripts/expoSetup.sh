#!/usr/bin/env sh

setupAndroidExpo(){
    installPacotes "nodejs npm yarn"
    menu12345 "
[1] INSTALAR EXPO-CLI YARN
[2] INSTALAR EXPO-CLI NPM
" "yarn add expo-cli --global
" "npm install expo-cli --global"

    yesorno "The New Expo CLI" "npm i -g expo-cli"
    yesorno "UPGRADE EXPO-CLI" "expo upgrade"

    criaDiretorioInstall "$HOME/AndroidExpo"
    echo "INICIAR UM PROJETO
expo init NOME-PROJETO
ENTRAR NA PASTA DO PROJETO
cd NOME-PROJETO
INICIAR O PROJETO
expo start"
}

criarProjetoExpo(){
    cd $HOME/AndroidExpo 
    echo "NOME DO PROJETO:"
    read pName
    expo init $pName
    cd $pName
    yesorno "EXPO START" "expo start"
}