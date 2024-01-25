#!/usr/bin/env sh
virtualGamepads(){
    echo "Dependencias"
    installPacotes "nodejs-lts-hydrogen"
    installName="VirtualGamepads"
    uninstallPastaAtalhoBinMesmoNome "$installName"
    criaDiretorioInstall "$dBashMenu/$installName"
    criaPastaBaixaExtrai "$diretorioInstall" "https://codeload.github.com/jehervy/node-virtual-gamepads/zip/refs/heads/master" "nvg.zip"
    mv */* .
    npm install
    criaAtalho "Virtual Gamepads" "Virtual Gamepads Linux" "sudo node main.js" "$diretorioInstall" "true" "$installName" "$diretorioInstall/public/images/SNES_controller.svg"
    #criaAtalhoBin "$diretorioInstall/run.sh" "$installName"

}   