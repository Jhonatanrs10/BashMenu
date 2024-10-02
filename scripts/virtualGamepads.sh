#!/usr/bin/env sh
virtualGamepads(){
    echo "Dependencias"
    packagesManager "nodejs-lts-hydrogen npm"
    installName="VirtualGamepads"
    uninstallPastaAtalhoBinMesmoNome "$installName"
    criaDiretorioInstall "$dBashMenu/$installName"
    criaPastaBaixaExtrai "$diretorioInstall" "https://codeload.github.com/jehervy/node-virtual-gamepads/zip/refs/heads/master" "nvg.zip"
    mv */* .
    npm install
    sudo npm install -g qrcode-terminal
    echo '#!/usr/bin/env sh
	cd '"$diretorioInstall"'
    sudo echo http://$(ip route get 1 | sed -n '"'"'s/.*src \([0-9.]\+\).*/\1/p'"'"'):80 | qrcode-terminal
    sudo node main.js' > $diretorioInstall/run.sh
    criaAtalho "Virtual Gamepads" "Virtual Gamepads Linux" "bash run.sh" "$diretorioInstall" "true" "$installName" "$diretorioInstall/public/images/SNES_controller.svg"
    #criaAtalhoBin "$diretorioInstall/run.sh" "$installName"

}   