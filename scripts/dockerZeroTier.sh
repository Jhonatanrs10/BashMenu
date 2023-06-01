#!/usr/bin/env sh
dockerZeroTier(){
    #cria imagem
    sudo docker pull henrist/zerotier-one
    #roda em background
    sudo docker run \
  -d \
  --restart unless-stopped \
  --name zerotier-one \
  --device /dev/net/tun \
  --net host \
  --cap-add NET_ADMIN \
  --cap-add SYS_ADMIN \
  -v /var/lib/zerotier-one:/var/lib/zerotier-one \
  henrist/zerotier-one
    #status do servico
    sudo docker exec zerotier-one zerotier-cli status
    echo "USE O COMNADO PARA ENTRAR EM UMA REDE: 
sudo docker exec zerotier-one zerotier-cli join NETWORK-ID"
    criaDiretorioInstall "$HOME/.Jhonatanrs/DockerZeroTier"
    criarArq "#!/usr/bin/env sh
echo '
COMANDOS:
# startar o docker = sudo service docker start
# baixa IMAGES = sudo docker pull
# ver IMAGES = sudo docker images 
# lista containers rodando = sudo docker ps
# lista todos containers = sudo docker ps -a
# remover container sudo docker rm ID-ou-NomeContainer
# remover Images sudo docker rmi ID-ou-NomeContainer
# iniciar ou parar containers = sudo docker start ou stop ID-ou-NomeContainer
USE O COMNADO PARA ENTRAR EM UMA REDE: 
sudo docker exec zerotier-one zerotier-cli join NETWORK-ID'
" "dockerZeroTier.sh"
    criaAtalhoBin "$diretorioInstall/dockerZeroTier.sh" "dockerZeroTierstart"
}