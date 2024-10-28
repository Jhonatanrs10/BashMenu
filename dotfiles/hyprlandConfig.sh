#!/usr/bin/env sh
hyprlandConfig(){
  mkdir -p $HOME/.config/hypr
  criarArqv2 'monitor=,preferred,auto,auto
env = XCURSOR_SIZE,24
env = HYPRCURSOR_SIZE,24
env = ELECTRON_OZONE_PLATFORM_HINT,wayland
general { 
    gaps_in = 5
    gaps_out = 20
    border_size = 2
    col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
    col.inactive_border = rgba(595959aa)
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
        enabled = true
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
gestures {
    workspace_swipe = false
}
device {
    name = epic-mouse-v1
    sensitivity = -0.5
}
# Variables
$terminal = alacritty
$browser = chromium
$fileManager = pcmanfm
$menu = wofi
$ppc = $HOME/.config/jrs/powerprofiles.sh
$pvc = $HOME/.config/jrs/picomsync.sh
# Autostart
exec-once = hyprpaper
exec-once = waybar
# Binds
$mainMod = SUPER
bind = $mainMod, RETURN, exec, $terminal
bind = $mainMod SHIFT, Q, killactive,
bind = $mainMod, X, exec, $fileManager
bind = $mainMod, C, exec, $browser
bind = $mainMod SHIFT, SPACE, togglefloating,
bind = $mainMod, D, exec, $menu
#bind = $mainMod, P, pseudo, 
bind = $mainMod, P, exec, $ppc, 
bind = $mainMod, J, togglesplit, 
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d
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
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10
bind = $mainMod, S, exec, $pvc
#bind = $mainMod, S, togglespecialworkspace, magic
bind = $mainMod SHIFT, S, movetoworkspace, special:magic
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow
# Window Config
windowrulev2 = suppressevent maximize, class:.*
windowrulev2 = stayfocused,class:(Rofi)
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
' "$HOME/.config/hypr/hyprland.conf"
}