#!/usr/bin/env sh

nodejslts(){

    installName="NodeJS"
    criaDiretorioInstall "$dBashMenu/$installName"

    criaPastaBaixaExtrai "$diretorioInstall" "https://nodejs.org/dist/v20.9.0/node-v20.9.0-linux-x64.tar.xz" "node.tar.xz"

    sudo cp -r $diretorioInstall/* /usr/
    export PATH=/usr/node*/bin:$PATH
    
    rm -r $diretorioInstall
}