#!/usr/bin/env sh
installFirefox(){
        uninstallPastaAtalhoBinMesmoNome "FirefoxJRS"
        varFirefox="https://download-installer.cdn.mozilla.net/pub/firefox/releases/113.0.2/linux-x86_64/en-US/firefox-113.0.2.tar.bz2"
        diretorioFirefox="$dBashMenu/FirefoxJRS"
	criaPastaBaixaExtrai "$dBashMenu/FirefoxJRS" "$varFirefox" "firefox.tar.bz2"
        cd $diretorioFirefox
        criaAtalho "FirefoxJRS" "Mozilla Browser" "bash runFirefox.sh" "$diretorioFirefox" "false" "FirefoxJRS" "$dBashMenu/Icons/icon-firefox.svg"
	criaAtalhoBin "$diretorioFirefox/firefox/firefox" "FirefoxJRS"
        criarArq "#!/usr/bin/env bash
cd $diretorioFirefox/firefox
./firefox" "runFirefox.sh"
}