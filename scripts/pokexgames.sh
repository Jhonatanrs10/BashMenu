#!/usr/bin/env sh
pxg="https://download.pokexgames.com/pxg-linux.zip"
installPokexgames(){
    criaDiretorio "diretorioServer" "$HOME/.Jhonatanrs/Pokexgames"
	criaPastaBaixaExtrai "$diretorioServer" "$pxg" "pxg.zip"
    criaAtalhoBin "$diretorioServer/pxgme-linux" "Pokexgames"
}