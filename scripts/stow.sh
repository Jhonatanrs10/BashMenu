setupStow(){
    
    echo "[1]STOW ALL [2]UNSTOW ALL"
    read resp
    echo "Type dotfiles path:"
    read stowDir
    cd $stowDir
    case $resp in
    1)
    stow -t ~ alacritty
    stow -t ~ bspwm
    stow -t ~ dunst
    stow -t ~ fastfetch
    stow -t ~ hypr
    stow -t ~ i3
    stow -t ~ i3status
    stow -t ~ jrs
    stow -t ~ mangohud
    stow -t ~ picom
    stow -t ~ polybar
    stow -t ~ rofi
    stow -t ~/.local/share/applications shortcuts
    stow -t ~ sxhkd
    stow -t ~ waybar
    stow -t ~ wofi
    ;;
    2)
    stow -D -t ~ alacritty
    stow -D -t ~ bspwm
    stow -D -t ~ dunst
    stow -D -t ~ fastfetch
    stow -D -t ~ hypr
    stow -D -t ~ i3
    stow -D -t ~ i3status
    stow -D -t ~ jrs
    stow -D -t ~ mangohud
    stow -D -t ~ picom
    stow -D -t ~ polybar
    stow -D -t ~ rofi
    stow -D -t ~/.local/share/applications shortcuts
    stow -D -t ~ sxhkd
    stow -D -t ~ waybar
    stow -D -t ~ wofi
    ;;
    *)
    ;;
    esac
}