#!/usr/bin/env sh
pxg="https://download.pokexgames.com/pxg-linux.zip"
installPokexgames(){
    criaDiretorio "diretorioServer" "$dBashMenu/Pokexgames"
	criaPastaBaixaExtrai "$diretorioServer" "$pxg" "pxg.zip"
    criaAtalhoBin "$diretorioServer/pxgme-linux" "Pokexgames"
}