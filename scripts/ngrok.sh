#!/usr/bin/env sh
#https://github.com/ChaoticWeg/discord.sh
installNgrok(){
    arqNgrok="https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz"
    arqDiscord="https://github.com/ChaoticWeg/discord.sh/archive/refs/heads/master.zip"
    uninstallPastaAtalhoBinMesmoNome "Ngrok"
    echo -e "[INFO] - DEPENDENCIAS - [INFO]"
    criaDiretorio "diretorioNgrok" "$dBashMenu/Ngrok"
    baixaArq "diretorioNome" "$arqNgrok" "$diretorioNgrok/ngrok.tgz"
    baixaArq "diretorioNome" "$arqDiscord" "$diretorioNgrok/bot.zip"
    echo -e "[INFO] - INSTALANDO NGROK - [INFO]"
	cd $diretorioNgrok
	extrairArq "$diretorioNgrok"
    mv discord* discord
	echo -e "
Connect your account (https://ngrok.com/)\nEx.:ngrok config add-authtoken ******"
	read auth_key
	./$auth_key
    criarArq "#!/usr/bin/env sh
bash $diretorioNgrok/discord.sh & bash $diretorioNgrok/ngrok.sh" "$diretorioNgrok/start.sh"
    criarArq "#!/usr/bin/env sh
	cd $diretorioNgrok
	./ngrok tcp 25565" "$diretorioNgrok/ngrok.sh"
	echo -e "
COLE AQUI O LINK DA API DO BOT WEBHOOK DO DISCORD"
	read webh
    criarArq '#!/usr/bin/env sh
sleep 15
WEBHOOK="'$webh'"
ServerIp=`curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url`
ServerIp=${ServerIp:6}
if [ -z "$ServerIp" ];then
    echo "VAZIO"
else
    bash '$PWD'/discord/discord.sh --webhook-url="$WEBHOOK" --title "IP DO SERVIDOR" --description "$ServerIp"
fi' "$diretorioNgrok/discord.sh"
	criaAtalhoBin "$diretorioNgrok/start.sh" "Ngrok"
}