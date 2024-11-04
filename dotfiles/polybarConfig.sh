#!/usr/bin/env sh
polybarConfig(){
    mkdir -p $HOME/.config/polybar
    criarArq '[colors]
color_bad = #FF0000
color_degraded = #FFFF00
color_bar = '#99$jrsbar'
color_text = '#$jrsbartexto'
color_main = '#$jrswindowcomfoco'

[bar/jrs]
width = 100%
height = 22pt
radius = 6
border-top-size = 5pt
border-left-size = 5pt
border-right-size = 5pt
border-bottom-size = 1pt
border-color = #00000000
module-margin = 0
line-size = 2.5pt
;dpi = 66%
background = ${colors.color_bar}
foreground = ${colors.color_text}
bottom = false
padding-left = 1
padding-right = 1
separator =
separator-foreground = ${colors.color_main}
wm-restack = bspwm

font-0 = '$dotFont':style=Regular:size=8;2
font-1= FontAwesome6Free:style=Solid:size=8;2
font-2= FontAwesome6Free:style=Regular:size=8;2
font-3= FontAwesome6Brands:style=Regular:size=8;2

modules-left = xworkspaces xwindow
modules-center = date
modules-right = xkeyboard temperature pulseaudio battery systray
#modules-right = xkeyboard cpu memory filesystem zerotier wlan eth pulseaudio battery date systray

cursor-click = pointer
cursor-scroll = ns-resize

enable-ipc = true

[module/systray]
type = internal/tray
format-margin = 2pt
tray-spacing = 2pt
tray-size = 66%

[module/i3]
type = internal/i3
pin-workspaces = true
strip-wsnumbers = true
index-sort = true
enable-click = true
enable-scroll = false
wrapping-scroll = false
reverse-scroll = false
fuzzy-match = false

label-mode = %mode%
label-mode-padding = 2
label-mode-background = ${colors.color_bad}

label-focused = %name%
label-focused-background = ${colors.background}
label-focused-underline = ${colors.primary}
label-focused-padding = 2

label-unfocused = %index%: %name%
label-unfocused-padding = 2

label-urgent = %index%: %name%
label-urgent-background = ${colors.color_bad}
label-urgent-padding = 2

[module/xworkspaces]
type = internal/xworkspaces

label-active = %name%
label-active-background = ${colors.color_bar}
label-active-underline= ${colors.color_main}
label-active-padding = 1.5

label-occupied = %name%
label-occupied-padding = 1

label-urgent = %name%
label-urgent-background = ${colors.color_bad}
label-urgent-padding = 1

label-empty =
label-empty-foreground = ${colors.color_degraded}
label-empty-padding = 1

[module/xwindow]
type = internal/xwindow
label = " %title:0:60:...%"

[module/filesystem]
type = internal/fs
interval = 25
fixed-values = true
spacing = 0
warn-percentage = 85
mount-0 = /
mount-1 = /run/media/jhonatanrs/JR
label-mounted = [SSD/%percentage_used%%]
label-unmounted = 
label-unmounted-foreground = ${colors.color_degraded}

[module/battery2]
type = internal/battery
full-at = 99
low-at = 5
battery = BAT1
adapter = ACAD
poll-interval = 5
label-charging = [CHR/%percentage%%]
label-discharging = [BAT/%percentage%%]
label-full = [FULL/%percentage%%]

[module/pulseaudio2]
type = internal/pulseaudio

format-volume-prefix = [♪/
format-volume-prefix-foreground = ${colors.color_text}
format-volume = <label-volume>]

label-volume = %percentage%%

label-muted = [♪/muted]
label-muted-foreground = ${colors.color_degraded}

[module/xkeyboard]
type = internal/xkeyboard

format-spacing = 0

label-layout =
label-indicator = [%name%]
label-layout-foreground = ${colors.color_text}

label-indicator-padding = 0
label-indicator-margin = 0
label-indicator-foreground = ${colors.color_text}
label-indicator-background = ${colors.color_bar}

[module/memory]
type = internal/memory
interval = 5
warn-percentage = 75
format-prefix = [RAM/
format-prefix-foreground = ${colors.color_text}
label = %percentage_used:2%%]

[module/cpu]
type = internal/cpu
interval = 5
warn-percentage = 75
format-prefix = [CPU/
format-prefix-foreground = ${colors.color_text}
label = %percentage:1%%]

[network-base]
type = internal/network
interval = 5
format-connected = <label-connected>
format-disconnected = <label-disconnected>
label-disconnected = 

[module/zerotier]
inherit = network-base
interface = ztugaqpmi7
label-connected = [Z/%local_ip%]

[module/wlan]
inherit = network-base
interface-type = wireless
label-connected = [W/%local_ip%]

[module/eth]
inherit = network-base
interface-type = wired
label-connected = [E/%local_ip%]

[module/date]
type = internal/date
interval = 5

date-alt = %H:%M:%S
date = %a.%d %b %H:%M

label = %date%
label-foreground = ${colors.color_text}

[module/battery]
type = internal/battery
full-at = 99
low-at = 5
battery = BAT1
adapter = ADP1
poll-interval = 5
time-format = %H:%M
format-charging = <animation-charging> <label-charging>
format-discharging = <ramp-capacity> <label-discharging>
label-charging = %percentage%%
label-discharging = %percentage%%
label-full = "  100%"
label-low = "  0%"
ramp-capacity-0 = " "
ramp-capacity-1 = " "
ramp-capacity-2 = " "
ramp-capacity-3 = " "
ramp-capacity-4 = " "
bar-capacity-width = 10
animation-charging-0 = " "
animation-charging-1 = " "
animation-charging-2 = " "
animation-charging-3 = " "
animation-charging-4 = " "
animation-charging-framerate = 750
animation-discharging-0 = " "
animation-discharging-1 = " "
animation-discharging-2 = " "
animation-discharging-3 = " "
animation-discharging-4 = " "
animation-discharging-framerate = 500
animation-low-0 = !
animation-low-1 = 
animation-low-framerate = 200
[module/pulseaudio]
type = internal/pulseaudio
use-ui-max = true
interval = 5
reverse-scroll = false
format-volume = <ramp-volume> <label-volume>
label-muted = 
label-muted-foreground = #666
ramp-volume-0 = 
ramp-volume-1 = 
ramp-volume-2 = 
click-right = pavucontrol
[settings]
screenchange-reload = true
pseudo-transparency = true
[module/temperature]
type = internal/temperature
interval = 0.5
thermal-zone = 0
zone-type = x86_pkg_temp
hwmon-path = /sys/devices/platform/coretemp.0/hwmon/hwmon2/temp1_input
base-temperature = 20
warn-temperature = 60 
label =   %temperature-c%
' "$HOME/.config/polybar/config.ini"
}
