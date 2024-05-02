#!/usr/bin/env bash
#
# Gerador de Resource de Skins Minecraft 1.8
# Importa a Skin em um Resource Pack de Textura possibilitando o uso da Skin sem Internet
# Mudando a skin do Steve e Alex para a skin do Resource Pack
#
# Como usar?
#
# Coloque as skins.png na pasta Skins (não coloque espaço no nome dos arquivos png) após isso execute o .sh
# Ex.: bash ./criarResourceDeSkin.sh
# Sera criado uma pasta resourcepacks com os Resource Pack
#

criaPackMCMeta(){
	echo '{
	  "pack": {
	    "pack_format": 1,
	    "description": "By Jhonatanrs"
	  }
	}' >> pack.mcmeta
}

crop1ponto7Skins(){
	# usando o ImageMagick cortamos a imagem para a versão 1.7 64x32 px
	#sudo apt-get install imagemagick
	for skin in `ls Skins`
	do
		mkdir -p Skins-Convertidas
		convert Skins/$skin -crop 64x64+0-32 Skins-Convertidas/OLD-$skin
		cp -a Skins/$skin Skins-Convertidas/NEW-$skin
	done
}

criaResourcesSkins(){
	for skin in `ls Skins-Convertidas`
	do
		mkdir -p novaSource/assets/minecraft/textures/entity
		cd novaSource
		criaPackMCMeta
		cd ..
		mkdir -p resourcepacks
		cp -a Skins-Convertidas/$skin novaSource/assets/minecraft/textures/entity/alex.png
		cp -a Skins-Convertidas/$skin novaSource/assets/minecraft/textures/entity/steve.png
		cp -a Skins-Convertidas/$skin novaSource/pack.png
		cd novaSource 
		zip -r ${skin::-4}.zip *
		mv ${skin::-4}.zip ../resourcepacks
		cd ..
		rm -r novaSource
	done
}

GeradorResourceSkinsMinecraft(){
	crop1ponto7Skins
	criaResourcesSkins
	rm -r Skins-Convertidas
}







