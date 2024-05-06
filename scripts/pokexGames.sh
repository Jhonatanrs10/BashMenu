#!/usr/bin/env sh
installPokexgames(){
    pxg="https://download.pokexgames.com/pxg-linux.zip"
    diretorioPokexgames="$dBashMenu/Pokexgames"
    uninstallPastaAtalhoBinMesmoNome "Pokexgames"
	criaPastaBaixaExtrai "$diretorioPokexgames" "$pxg" "pxg.zip"
    criaAtalho "Pokexgames" "Tibia Pokemon" "./pxgme-linux" "$diretorioPokexgames" "false" "Pokexgames" "application-default-icon"
    criaAtalhoBin "$diretorioPokexgames/pxgme-linux" "Pokexgames"
}