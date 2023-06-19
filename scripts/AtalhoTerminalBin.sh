#!/usr/bin/env sh
AtalhoTerminalBin(){
    varAtalhoTerminalBin="vazio"
    clear
    while [ "$varAtalhoTerminalBin" != "" ];
    do
        echo "ESCOLHA UMA DAS OPCOES:  [1]CriaAtalhoTBin, [2]removeAtalhoTBin"
        read resp
        if [ "$resp" = "1" ]; then
            criaAtalhoTerminalBin
        elif [ "$resp" = "2" ]; then
            removeAtalhoBinJrs
        else
            echo "NENHUMA OPCAO FOI ESCOLHIDA."
            exit 1
        fi
        clear
    done
}

criaAtalhoTerminalBin(){
    criaDiretorioInstall "$dBashMenu/Bins"   
    echo "DIGITE OU COLE O COMANDO DE TERMINAL:"
    read comandoTerminal
    echo "DIGITE OU COLE O NOME DO ATALHO/ARQUIVO BIN:"
    read atalhoBin
        criarArq "#!/usr/bin/env sh
$comandoTerminal" "$atalhoBin.sh"
    criaAtalhoBin "$diretorioInstall/$atalhoBin.sh" "$atalhoBin"
}

criaAtalhoFlatpakBin(){
    diretorioFlatpak="/var/lib/flatpak/exports/bin/"
    for flatpak in `ls $diretorioFlatpak`
    do
        criaAtalhoBin "$diretorioFlatpak$flatpak" "$flatpak"
    done
}

removeAtalhoBinJrs(){
    cd /usr/bin
    echo "[Bins]"
    ls jrs-*
    echo "DIGITE O NOME DO ATALHO/ARQUIVO BIN QUE DESEJA REMOVER: (SEM O 'jrs-')"
    read atalhoBin
    removeAtalhoBin "$atalhoBin"
    rm $dBashMenu/Bins/$atalhoBin.sh
    cd $HOME
}
