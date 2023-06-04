#!/usr/bin/env sh
assistirMpv(){
        #streamlink,  youtube-dl e mpv
        installPacotes "streamlink youtube-dl mpv"
        echo "Escolha uma das opcoes: [twitch, link]"
        read resp
        if [ "$resp" = "twitch" ]; then
                clear
                echo "DIGITE O NOME DO CANAL DA TWITCH:"
                read canalTwitch
                mpv "https://www.twitch.tv/$canalTwitch"
        elif [ "$resp" = "link" ]; then
                clear
                echo "COLE O LINK DO VIDEO:"
                read canalLink
                mpv "$canalLink"
        fi
}
