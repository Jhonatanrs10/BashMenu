#!/usr/bin/env sh
hyprlandConfig(){
  mkdir -p $HOME/.config/hypr
  criarArqv2 'monitor=,preferred,auto,auto
env = XCURSOR_SIZE,24
env = HYPRCURSOR_SIZE,24
env = ELECTRON_OZONE_PLATFORM_HINT,wayland
env = LIBVA_DRIVER_NAME,nvidia
env = XDG_SESSION_TYPE,wayland
env = GBM_BACKEND,nvidia-drm
env = __GLX_VENDOR_LIBRARY_NAME,nvidia
general { 
    gaps_in = 5
    gaps_out = 5
    border_size = 3
    col.active_border = rgb('$jrswindowcomfoco')
    col.inactive_border = rgb('$jrswindowsemfoco')
    resize_on_border = false 
    allow_tearing = false
    layout = dwindle
}
decoration {
    rounding = 10
    active_opacity = 1.0
    inactive_opacity = 1.0
    drop_shadow = true
    shadow_range = 4
    shadow_render_power = 3
    col.shadow = rgba(1a1a1aee)
    blur {
        enabled = false
        size = 3
        passes = 1
        vibrancy = 0.1696
    }
}
animations {
    enabled = true
    bezier = myBezier, 0.05, 0.9, 0.1, 1.05
    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = border, 1, 10, default
    animation = borderangle, 1, 8, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, default
}
dwindle {
    pseudotile = true
    preserve_split = true
}
master {
    #new_is_master = true
}
misc { 
    force_default_wallpaper = 0
    disable_hyprland_logo = true 
    }
input {
    kb_layout = br
    kb_variant =
    kb_model =
    kb_options =
    kb_rules =
    follow_mouse = 1
    sensitivity = 0
    touchpad {
        natural_scroll = false
    }
}
cursor {
    no_hardware_cursors = true
}
gestures {
    workspace_swipe = false
}
device {
    name = epic-mouse-v1
    sensitivity = -0.5
}
# Variables
$terminal = alacritty
$browser = xdg-open https:
$fileManager = pcmanfm
$menu = pkill wofi || wofi
$ppc = $HOME/.config/jrs/powerprofiles.sh
$pvc = $HOME/.config/jrs/hypranim.sh
$themeMode = $HOME/.config/jrs/themeMode.sh
$waybarHide = killall -SIGUSR1 waybar
$nitrogenWayland = azote
# Autostart
exec-once = ~/.azotebg-hyprland
exec-once = waybar
exec-once = nm-applet
exec-once = blueman-applet
exec-once = kdeconnect-indicator
exec-once = /usr/bin/dunst
exec-once = /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
# Binds
$mainMod = SUPER
bind = $mainMod, W, togglegroup
bind = $mainMod, RETURN, exec, $terminal
bind = $mainMod SHIFT, Q, killactive,
bind = ALT, F4, killactive,
bind = $mainMod, X, exec, $fileManager
bind = $mainMod, C, exec, $browser
bind = $mainMod, B, exec, $waybarHide
bind = $mainMod SHIFT, SPACE, togglefloating,
bind = $mainMod, F, fullscreen 
bind = $mainMod, D, exec, $menu
bind = $mainMod, P, exec, $ppc
bind = $mainMod, N, exec, $nitrogenWayland
bind = $mainMod, T, exec, $themeMode
bind = $mainMod, V, togglesplit, 
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = ALT, TAB, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d
bind = $mainMod SHIFT, left, movewindow, l
bind = $mainMod SHIFT, right, movewindow, r
bind = $mainMod SHIFT, up, movewindow, u
bind = $mainMod SHIFT, down, movewindow, d
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10
bind = $mainMod SHIFT, 1, movetoworkspacesilent, 1
bind = $mainMod SHIFT, 2, movetoworkspacesilent, 2
bind = $mainMod SHIFT, 3, movetoworkspacesilent, 3
bind = $mainMod SHIFT, 4, movetoworkspacesilent, 4
bind = $mainMod SHIFT, 5, movetoworkspacesilent, 5
bind = $mainMod SHIFT, 6, movetoworkspacesilent, 6
bind = $mainMod SHIFT, 7, movetoworkspacesilent, 7
bind = $mainMod SHIFT, 8, movetoworkspacesilent, 8
bind = $mainMod SHIFT, 9, movetoworkspacesilent, 9
bind = $mainMod SHIFT, 0, movetoworkspacesilent, 10
bind = $mainMod, A, exec, $pvc
bind = $mainMod SHIFT, S, movetoworkspace, special:magic
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow
# Window Config
windowrulev2 = suppressevent maximize, class:.*
windowrulev2 = stayfocused,class:(Wofi)
# Media Control
bind = , XF86AudioPlay, exec, playerctl play-pause
bind = , XF86AudioPause, exec, playerctl play-pause
bind = , XF86AudioNext, exec, playerctl next
bind = , XF86AudioPrev, exec, playerctl previous
# Sound
bind = $mainMod CTRL, up, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%
bind = $mainMod CTRL, down, exec, pactl set-sink-volume @DEFAULT_SINK@ -5% 
bind = $mainMod CTRL, M, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle 
bind = , XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%
bind = , XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%
bind = , XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle
bind = , XF86AudioMicMute, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle
# Brightness
bind = $mainMod CTRL, left, exec, xbacklight -dec 5 
bind = $mainMod CTRL, right, exec, xbacklight -inc 5
bind = , XF86MonBrightnessDown, exec, xbacklight -dec 5 
bind = , XF86MonBrightnessUp, exec, xbacklight -inc 5
# Power
bind = $mainMod SHIFT, E, exit,
bind = $mainMod CTRL, 7, exec, systemctl suspend
bind = $mainMod, L, exec, dm-tool lock
bind = $mainMod CTRL, 8, exec, ystemctl hibernate
bind = $mainMod CTRL, 9, exec, systemctl reboot
bind = $mainMod CTRL, 0, exec, systemctl poweroff -i
# ColorPicker
bind = $mainMod, Z, exec, hyprpicker -a -f hex
# Print
# screenshot 
bind =, Print, exec, grim -g "$(slurp)" - | wl-copy && wl-paste > ~/Pictures/PrtSc/Cutshot-$(date +%F_%T).png 
bind = $mainMod, Print, exec, grim - | wl-copy && wl-paste > ~/Pictures/PrtSc/Screenshot-$(date +%F_%T).png

# Resizing with submap    
bind = $mainMod, R, submap,resize    
submap = resize    
binde=,right,resizeactive,  40 0    
binde=,left,resizeactive, -40 0    
binde=,up,resizeactive,   0 -40    
binde=,down,resizeactive,   0 40    
bind = ,escape, submap, reset    
bind = ,return,  submap, reset    
submap = reset
' "$HOME/.config/hypr/hyprland.conf"
}
