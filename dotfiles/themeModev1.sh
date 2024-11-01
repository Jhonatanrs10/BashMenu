#!/usr/bin/bash
themeModev1(){
    sudo chmod 777 /etc/lightdm/lightdm-gtk-greeter.conf
    mkdir -p $HOME/.config/jrs
    criarArqv2 'mkdir -p $HOME/.config/gtk-2.0/
    mkdir -p $HOME/.config/gtk-3.0/
    mkdir -p $HOME/.config/gtk-4.0/
    dirSettings0="/etc/lightdm/lightdm-gtk-greeter.conf"
    dirSettings1="$HOME/.gtkrc-2.0"
    dirSettings2="$HOME/.config/gtk-2.0/settings.ini"
    dirSettings3="$HOME/.config/gtk-3.0/settings.ini"
    dirSettings4="$HOME/.config/gtk-4.0/settings.ini"
    notifyValueNow=$(grep "gtk-icon-theme-name" $dirSettings3)
    modeErase(){
        sed -i '"'"'/gtk-theme-name/d'"'"' $dirSettings3
        sed -i '"'"'/gtk-icon-theme-name/d'"'"' $dirSettings3
        sed -i '"'"'/gtk-cursor-theme-name/d'"'"' $dirSettings3
        sed -i '"'"'/gtk-font-name/d'"'"' $dirSettings3
        sed -i '"'"'/gtk-theme-name/d'"'"' $dirSettings1
        sed -i '"'"'/gtk-icon-theme-name/d'"'"' $dirSettings1
        sed -i '"'"'/gtk-cursor-theme-name/d'"'"' $dirSettings1
        sed -i '"'"'/gtk-font-name/d'"'"' $dirSettings1
        sed -i '"'"'/theme-name =/d'"'"' $dirSettings0
        sed -i '"'"'/icon-theme-name =/d'"'"' $dirSettings0
        sed -i '"'"'/cursor-theme-name =/d'"'"' $dirSettings0
        sed -i '"'"'/font-name/d'"'"' $dirSettings0
    }
    case $notifyValueNow in
    "gtk-icon-theme-name=Papirus-Dark")
        modeErase
        echo "gtk-theme-name=Breeze
gtk-icon-theme-name=Papirus-Light
gtk-cursor-theme-name=capitaine-cursors-light
gtk-font-name=$dotFont 10" >> $dirSettings3
        echo '"'"'gtk-theme-name="Breeze"
gtk-icon-theme-name="Papirus-Light"
gtk-cursor-theme-name="capitaine-cursors-light"
gtk-font-name="'"'"'$dotFont'"'"' 10"'"'"' >> $dirSettings1
        tee -a $dirSettings0 <<< '"'"'theme-name = Breeze
icon-theme-name = Papirus-Light
cursor-theme-name = capitaine-cursors-light
font-name = '"'"'$dotFont'"'"' 10'"'"'
        cp $dirSettings3 $dirSettings2
        cp $dirSettings3 $dirSettings4
      dunstify --hints int:transient:1 "Theme Mode" "Light" --icon=preferences-desktop-theme
      ;;
    "gtk-icon-theme-name=Papirus-Light")
        modeErase
        echo "gtk-theme-name=Breeze-Dark
gtk-icon-theme-name=Papirus-Dark
gtk-cursor-theme-name=capitaine-cursors
gtk-font-name=$dotFont 10" >> $dirSettings3
        echo '"'"'gtk-theme-name="Breeze-Dark"
gtk-icon-theme-name="Papirus-Dark"
gtk-cursor-theme-name="capitaine-cursors"
gtk-font-name="'"'"'$dotFont'"'"' 10"'"'"' >> $dirSettings1
        tee -a $dirSettings0 <<< '"'"'theme-name = Breeze-Dark
icon-theme-name = Papirus-Dark
cursor-theme-name = capitaine-cursors
font-name = '"'"'$dotFont'"'"' 10'"'"'
        cp $dirSettings3 $dirSettings2
        cp $dirSettings3 $dirSettings4
      dunstify --hints int:transient:1 "Theme Mode" "Dark" --icon=preferences-desktop-theme
      ;;
    *)
      ;;
  esac' "$HOME/.config/jrs/themeMode.sh"
sudo chmod +x $HOME/.config/jrs/themeMode.sh
# criarArqv2 fica entre ' ' e dentro os a sinais de ' devem ser mudados para '"'"'
}
