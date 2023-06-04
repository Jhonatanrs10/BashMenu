#!/usr/bin/env sh
installFirefox(){
        varFirefox="https://download-installer.cdn.mozilla.net/pub/firefox/releases/113.0.2/linux-x86_64/en-US/firefox-113.0.2.tar.bz2"
	criaPastaBaixaExtrai "$dBashMenu/Firefox" "$varFirefox" "firefox.tar.bz2"
        cd $dBashMenu/Firefox
        criaAtalho "FirefoxJRS" "Mozilla Browser" "bash runFirefox.sh" "$dBashMenu/Firefox" "false" "FirefoxJRS" "$dBashMenu/Icons/icon-firefox.svg"
	criaAtalhoBin "$dBashMenu/Firefox/firefox/firefox" "firefox"
        criarArq "#!/usr/bin/env bash
cd $dBashMenu/Firefox/firefox
./firefox" "runFirefox.sh"
}

uninstallFirefox(){
        uninstallPastaAtalhoBin "$dBashMenu/Firefox" "FirefoxJRS.desktop" "firefox"
}