#!/usr/bin/env sh
criaSeuUsuarioSamba(){
	echo "CRIANDO SEU USUARIO NO SAMBA..."
	echo "USUARIO $USER DIGITE SUA SENHA:"
    sudo smbpasswd -a $USER
}
criaDiretorioShare(){
    echo "CRIANDO PASTA SE NAO EXISTIR..."
    mkdir $1
    echo "CONFIGURANDO PASTA NO SAMBA..."
    echo "[$2]
    comment = Pasta Compartilhada na Rede
    path = $1
    browseable = yes
    read only = no
    guest ok = no
    create mode = 0777
    directory mode = 0777" | sudo tee -a /etc/samba/smb.conf
	#COMANDO QUE CRIA USUARIO NO LINUX
	#adduser usuario
	#COMANDO QUE REMOVE USUARIO DO SAMBA
	#smbpasswd -x usuario
	#edite o arquivo /etc/samba/smb.conf abra com sudo para remover sua pasta da rede
}
#criaSeuUsuarioSamba
#criaDiretorioShare "diretorio/pasta" "nomePasta"