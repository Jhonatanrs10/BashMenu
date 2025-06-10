#!/usr/bin/env sh
nodejslts() {
    echo "Nodejs Manual[1] ou pacman[2]"
    read escolha
    if [ "$escolha" = "1" ]; then
        installName="NodeJS"
        criaDiretorioInstall "$dBashMenu/$installName"
        criaPastaBaixaExtrai "$diretorioInstall" "https://nodejs.org/dist/v20.9.0/node-v20.9.0-linux-x64.tar.xz" "node.tar.xz"
        sudo cp -r $diretorioInstall/* /usr/
        export PATH=/usr/node*/bin:$PATH
        rm -r $diretorioInstall
    elif [ "$escolha" = "2" ]; then
        packagesManager "nodejs-lts-iron"
        packagesManager "npm"
    fi
}
