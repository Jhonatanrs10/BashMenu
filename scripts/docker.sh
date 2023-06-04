#!/usr/bin/env sh
docker(){
    sudo apt update
    sudo apt install \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo chmod a+r /etc/apt/keyrings/docker.gpg
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
    sudo service docker start
    sudo docker run hello-world
    
    criaDiretorioInstall "$HOME/.Jhonatanrs/Docker"
    criarArq "#!/usr/bin/env sh
echo 'COMANDOS
# startar o docker = sudo service docker start
# baixa IMAGES = sudo docker pull
# ver IMAGES = sudo docker images 
# lista containers rodando = sudo docker ps
# lista todos containers = sudo docker ps -a
# remover container sudo docker rm ID-ou-NomeContainer
# remover Images sudo docker rmi ID-ou-NomeContainer
# iniciar ou parar containers = sudo docker start ou stop ID-ou-NomeContainer
EXECUTANDO: sudo service docker start'
sudo service docker start" "docker.sh"
    criaAtalhoBin "$diretorioInstall/docker.sh" "dockerstart"
}
