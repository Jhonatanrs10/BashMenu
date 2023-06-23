#!/usr/bin/env sh
assistirMpv(){
        #streamlink,  youtube-dl e mpv WORKING IN 2023
        installPacotes "yt-dlp mpv"
        resp="vazio"
        clear
        while [ "$resp" != "" ];
        do
                echo "ESCOLHA UMA DAS OPCOES:  [1]twitch, [2]link, [3]config1080p60, [4]config720p30"
                read resp
                if [ "$resp" = "1" ]; then
                        clear
                        echo "DIGITE O NOME DO CANAL DA TWITCH:"
                        read canalTwitch
                        mpv "https://www.twitch.tv/$canalTwitch"
                elif [ "$resp" = "2" ]; then
                        clear
                        echo "COLE O LINK DO VIDEO:"
                        read canalLink
                        mpv "$canalLink" 
                elif [ "$resp" = "3" ]; then
                        criarArq "ytdl-format=bestvideo[height<=?1080][fps<=?60][vcodec!=?vp9]+bestaudio/best" "$HOME/.config/mpv/mpv.conf" 
                elif [ "$resp" = "4" ]; then
                        criarArq "ytdl-format=bestvideo[height<=?720][fps<=?30][vcodec!=?vp9]+bestaudio/best" "$HOME/.config/mpv/mpv.conf" 
                else
                        echo "NENHUMA OPCAO FOI ESCOLHIDA."
                fi
                clear
        done
}
