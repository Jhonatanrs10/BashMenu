#!/usr/bin/env sh
installFivem(){
    verFivem="https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/6136-97e3790629f188c887ee11d119d7a705c8a9f9f0/fx.tar.xz"
    cfxData="https://github.com/citizenfx/cfx-server-data/archive/refs/heads/master.zip"
    modMenu="https://github.com/TomGrobbe/vMenu/releases/download/v3.5.0/vMenu-v3.5.0.zip"
    pvpMode="https://github.com/fcarvalho-bruno/enablepvp/archive/refs/heads/master.zip"
    handEditor="https://github.com/FRANkiller13/FiveM-Handling-Editor/archive/refs/heads/master.zip"
    streetRace="https://github.com/bepo13/FiveM-StreetRaces/archive/refs/heads/master.zip"
    modCars="https://drive.google.com/u/0/uc?id=1AWgqtDaNATQdr-2oLHhWNixdYa1C1Gv5&export=download"

    echo "FIVEM NAME FOLDER"
    read fivemNome
    uninstallPastaAtalhoBinMesmoNome "$fivemNome"

	echo -e "[INFO] - INSTALANDO FIVEM SERVER - [INFO]"
	criaDiretorio "diretorioServer" "$dBashMenu/$fivemNome"
	criaPastaBaixaExtrai "$diretorioServer" "$verFivem" "fx.tar.xz"
	
	criaPastaBaixaExtrai "$diretorioServer" "$cfxData" "data.zip"
    mv $diretorioServer/cfx-* $diretorioServer/server-data
	
	criaDiretorio "diretorioResource" "$diretorioServer/server-data/resources/[jhonatanrs]"

	criaPastaBaixaExtrai "$diretorioResource/vMenu" "$modMenu" "modmenu.zip"
	criaPastaBaixaExtrai "$diretorioResource/" "$handEditor" "handEditor.zip"
	criaPastaBaixaExtrai "$diretorioResource/" "$pvpMode" "pvpMode.zip"
	criaPastaBaixaExtrai "$diretorioResource/" "$streetRace" "streetRace.zip"
    criaPastaBaixaExtrai "$diretorioResource/teste" "$modCars" "modCars.zip"

    mv $diretorioResource/FiveM-StreetRaces-master/StreetRaces $diretorioResource/StreetRaces
    rm -r $diretorioResource/FiveM-StreetRaces-master
	cp $diretorioResource/vMenu/config/permissions.cfg $diretorioServer/server-data/permissions.cfg
	
    echo -e "License key for your server (https://keymaster.fivem.net)"
    read lk

	criarArq "#!/usr/bin/env sh
cd $diretorioServer/server-data && bash $diretorioServer/run.sh +exec server.cfg" "$diretorioServer/fivemexec.sh"

	#remove NPCs
	addNoArq '
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    SetVehicleDensityMultiplierThisFrame(0.0)
    SetPedDensityMultiplierThisFrame(0.0)
  end
end)' "$diretorioServer/server-data/resources//[gamemodes]/basic-gamemode/basic_client.lua"

	criarArq "<style type=text/css>
    body {
         background-color: white;
        background-image: url(loadscreen2.jpg);
        background-size: 30%;
        background-repeat: no-repeat;
        background-position-x: center;
        background-position-y: -25%;
    }
</style>" "$diretorioServer/server-data/resources/[test]/example-loadscreen/index.html"

	convert $dBashMenu/Icons/logojr.svg -resize 800x800 $diretorioServer/server-data/resources/[test]/example-loadscreen/loadscreen2.jpg
    convert $dBashMenu/Icons/logojr.svg -resize 96x96 $diretorioServer/server-data/myLogo.png
	convert $dBashMenu/Icons/logojr.svg -resize 96x96 $diretorioServer/myLogo.png

    addNoArq '# Only change the IP if youre using a server with multiple network interfaces, otherwise change the port only.
endpoint_add_tcp 0.0.0.0:30120
endpoint_add_udp 0.0.0.0:30120

exec permissions.cfg
start [jhonatanrs]
start example-loadscreen

# These resources will start by default.
ensure mapmanager
ensure chat
ensure spawnmanager
ensure sessionmanager
ensure basic-gamemode
ensure hardcap
ensure rconlog

# This allows players to use scripthook-based plugins such as the legacy Lambda Menu.
# Set this to 1 to allow scripthook. Do note that this does _not_ guarantee players wont be able to use external plugins.
sv_scriptHookAllowed 0

# Uncomment this and set a password to enable RCON. Make sure to change the password - it should look like rcon_password "YOURPASSWORD"
#rcon_password 

# A comma-separated list of tags for your server.
# For example:
# - sets tags drifting, cars, racing
# Or:
# - sets tags roleplay, military, tanks
sets tags roleplay, drifting, cars, racing

# A valid locale identifier for your servers primary language.
# For example en-US, fr-CA, nl-NL, de-DE, en-GB, pt-BR
sets locale pt-BR 
# please DO replace root-AQ on the line ABOVE with a real language! :)

# Set an optional server info and connecting banner image url.
# Size doesnt matter, any banner sized image will be fine.
#sets banner_detail https://url.to/image.png
#sets banner_connecting https://url.to/image.png

# Set your servers hostname. This is not usually shown anywhere in listings.
sv_hostname "Jardim Recreio"

# Set your servers Project Name
sets sv_projectName "Jardim Recreio"

# Set your servers Project Description
sets sv_projectDesc "Um bairro pra garotada brincar."

# Nested configs!
#exec server_internal.cfg

# Loading a server icon (96x96 PNG file)
load_server_icon myLogo.png

# convars which can be used in scripts
set temp_convar "Bem Vindo ao Bairro!"

# Remove the # from the below line if you want your server to be listed as private in the server browser.
# Do not edit it if you *do not* want your server listed as private.
# Check the following url for more detailed information about this:
# https://docs.fivem.net/docs/server-manual/server-commands/#sv_master1-newvalue
#sv_master1 

# Add system admins
add_ace group.admin command allow # allow all commands
add_ace group.admin command.quit deny # but dont allow quit
add_principal identifier.fivem:1 group.admin # add the admin to the group

# enable OneSync (required for server-side state awareness)
set onesync on

# Server player slot limit (see https://fivem.net/server-hosting for limits)
sv_maxclients 10

# Steam Web API key, if you want to use Steam authentication (https://steamcommunity.com/dev/apikey)
# -> replace  with the key
set steam_webApiKey

# License key for your server (https://keymaster.fivem.net)
sv_licenseKey '"$lk"'' "$diretorioServer/server-data/server.cfg"

criaAtalhoBin "$diretorioServer/fivemexec.sh" "$fivemNome"
}   