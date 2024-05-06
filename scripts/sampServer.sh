#!/usr/bin/env sh
sampServer(){

    installName="SampServer"
    uninstallPastaAtalhoBinMesmoNome "$installName"
    criaDiretorioInstall "$dBashMenu/$installName"


    criaPastaBaixaExtrai "$diretorioInstall" "http://files.sa-mp.com/samp037svr_R2-1.tar.gz" "samp.tar.gz"
    mv */* .

    criarArq "#!/usr/bin/env sh
cd $diretorioInstall
./samp03svr" "$diretorioInstall/run.sh"

    criarArq "echo Executing Server Config...
lanmode 1
rcon_password 0
maxplayers 20
port 7777
hostname Jardim Recreio
gamemode0 grandlarc 1
filterscripts base gl_actions gl_property gl_realtime
announce 0
query 1
weburl www.sa-mp.com
maxnpc 0
onfoot_rate 40
incar_rate 40
weapon_rate 40
stream_distance 300.0
stream_rate 1000" "$diretorioInstall/server.cfg"

    criaAtalho "$installName" "Server SAMP em Segundo Plano" "./samp03svr" "$diretorioInstall" "true" "$installName" "application-default-icon"
    criaAtalhoBin "$diretorioInstall/run.sh" "$installName"

}   