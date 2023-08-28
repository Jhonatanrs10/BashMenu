#!/usr/bin/env sh
criaSeuUsuarioSamba(){
   #pra ter usuario no samba tem que ter usuario no sistema
   echo "CRIAR USUARIO ($USER) NO SAMBA [s]/[n]"
   read resp
   if [ $resp = "s" ]; then
      sudo smbpasswd -a $USER
   else
      echo "Nada a fazer."
   fi 
}
criaDiretorioShare(){
   #criaSmbDefault
   echo "CRIANDO PASTA SE NAO EXISTIR..."
   sudo mkdir -p $1
   sudo $USER
   #sudo chown $USER: $1
   sudo chmod 777 $1
   echo "CONFIGURANDO PASTA NO SAMBA..."
   echo "[$2]
   comment = Pasta Compartilhada na Rede
   path = $1
   browseable = yes
   read only = yes
   guest ok = $3
   write list = $USER
   force directory mode = 0777
   directory mode = 0777
   create mode = 0777" | sudo tee -a /etc/samba/smb.conf
	#COMANDO QUE CRIA USUARIO NO LINUX
	#adduser usuario
	#COMANDO QUE REMOVE USUARIO DO SAMBA
	#smbpasswd -x usuario
	#edite o arquivo /etc/samba/smb.conf abra com sudo para remover sua pasta da rede
    
}
#criaSeuUsuarioSamba
#criaDiretorioShare "diretorio/pasta" "nomePasta" "guest ok"

criaSmbDefault(){
   sudo 
   echo '[global]
   workgroup = WORKGROUP
   netbios name = Samba
   server string = Samba Server
   server role = standalone server
   map to guest = Bad User
   log file = /usr/local/samba/var/log.%m
   max log size = 50
   dns proxy = no

[printers]
   comment = All Printers
   path = /usr/spool/samba
   browsable = no
   guest ok = no
   writable = no
   printable = yes
;[public]
;   path = /usr/somewhere/else/public
;   public = yes
;   only guest = yes
;   writable = yes
;   printable = no

# The following two entries demonstrate how to share a directory so that two
# users can place files there that will be owned by the specific users. In this
# setup, the directory should be writable by both users and should have the
# sticky bit set on it to prevent abuse. Obviously this could be extended to
# as many users as required.
;[myshare]
;   comment = Marys and Freds stuff
;   path = /usr/somewhere/shared
;   valid users = mary fred
;   public = no
;   writable = yes
;   printable = no
;   create mask = 0765' | sudo tee /etc/samba/default-smb-bkp.conf
}