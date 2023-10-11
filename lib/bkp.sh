#!/usr/bin/env sh
bkpTar(){
    ARQUIVO_BACKUP="bkp-$DATANOW.tar.gz"
    if [ -d "$2/$ARQUIVO_BACKUP" ]; then
		echo "$2/$ARQUIVO_BACKUP"
	    echo -e "DIRETORIO JA EXISTE"
    else
		echo -e "REALIZANDO BACKUP..."
		if tar -czSpf $2/$ARQUIVO_BACKUP $1; then
			echo -e "BACKUP REALIZADO COM SUCESSO"
		else
			echo -e "ERRO NO BACKUP"
		fi
    fi
}
bkpCopy(){
	echo -e "[INFO] - INSTALANDO DEPENDENCIAS - [INFO]"
	sudo apt install progress
    ARQUIVO_BACKUP="bkp-$DATANOW"
    if [ -d "$2/$ARQUIVO_BACKUP" ]; then
		echo "$2/$ARQUIVO_BACKUP"
	    echo -e "DIRETORIO JA EXISTE"
    else
	    mkdir "$2/$ARQUIVO_BACKUP"
		echo -e "REALIZANDO BACKUP..."
		if cp -uR $1 $2/$ARQUIVO_BACKUP | progress -m; then
			echo -e "BACKUP REALIZADO COM SUCESSO"
		else
			echo -e "ERRO NO BACKUP"
		fi
    fi
}
justCopy(){
	echo -e "[INFO] - INSTALANDO DEPENDENCIAS - [INFO]"
	sudo apt install progress
	echo -e "REALIZANDO COPIA..."
	cp -uR $1 $2 | progress -m
	echo -e "COPIA FINALIZADA!!!"
}
#bkpCopy "diretorioDosArquivos" "diretorioDoBackup"
#bkpTar "diretorioDosArquivos" "diretorioDoBackup"
#justCopy "diretorioDosArquivos" "diretorioDoBackup"