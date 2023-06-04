#!/usr/bin/env sh
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
    ls jrs-*
    echo "DIGITE O NOME DO ATALHO/ARQUIVO BIN QUE DESEJA REMOVER: (SEM O 'jrs-')"
    read atalhoBin
    removeAtalhoBin "$atalhoBin"
    cd $HOME
}
