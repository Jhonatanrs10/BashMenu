#!/usr/bin/env sh
assistirMpv(){
        #streamlink,  youtube-dl e mpv WORKING IN 2023
        packagesManager "yt-dlp mpv"
        resp="vazio"
        clear
        while [ "$resp" != "" ];
        do
                echo "ESCOLHA UMA DAS OPCOES:  [1]twitch, [2]link, [3]playlist, [4]playlist-1-mp3  [5]config1080p60, [6]config720p30, [7]config480p30"
                read resp
                if [ "$resp" = "1" ]; then
                        clear
                        echo "DIGITE O NOME DO CANAL DA TWITCH:"
                        read canalTwitch
                        echo "https://www.twitch.tv/popout/$canalTwitch/chat?popout="
                        echo "PRESS ENTER"
                        read canalTwitchChat
                        mpv "https://www.twitch.tv/$canalTwitch"
                elif [ "$resp" = "2" ]; then
                        clear
                        echo "COLE O LINK DO VIDEO:"
                        read canalLink
                        mpv "$canalLink" 
                elif [ "$resp" = "3" ]; then
                        clear
                        echo "COLE O LINK DA PLAYLIST:"
                        read playlistLink
                        cd $HOME/Downloads
                        yt-dlp --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" "$playlistLink"
                elif [ "$resp" = "4" ]; then  
                        clear
                        echo "COLE O DIRETORIO COM AS MUSICAS:"
                        read playlistLinkD
                        cd $playlistLinkD
                        ls *.mp3 | awk '{print "file", $0}' > juntim.txt
                        ffmpeg -f concat -i juntim.txt -c copy final.mp3     
                elif [ "$resp" = "5" ]; then
                        criarArq "ytdl-format=bestvideo[height<=?1080][fps<=?60][vcodec!=?vp9]+bestaudio/best" "$HOME/.config/mpv/mpv.conf" 
                elif [ "$resp" = "6" ]; then
                        criarArq "ytdl-format=bestvideo[height<=?720][fps<=?30][vcodec!=?vp9]+bestaudio/best" "$HOME/.config/mpv/mpv.conf" 
                elif [ "$resp" = "7" ]; then
                        criarArq "ytdl-format=bestvideo[height<=?480][fps<=?30][vcodec!=?vp9]+bestaudio/best" "$HOME/.config/mpv/mpv.conf" 
                else
                        echo "NENHUMA OPCAO FOI ESCOLHIDA."
                fi
                clear
        done
}
