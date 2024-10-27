#!/usr/bin/env sh
i3statusConfig(){
    mkdir -p $HOME/.config/i3status
    criarArq '# i3status configuration file.
# see "man i3status" for documentation.

# It is important that this file is edited as UTF-8.
# The following line should contain a sharp s:
# If the above line is not correctly displayed, fix your editor first!

general {
	colors = true
        interval = 5
	color_good = "'#$jrsbartexto'"
	color_bad = "#FF0000"
	color_degraded = "#FFFF00"
}

#order += "cpu_usage"
#order += "memory"
#order += "disk /"
#order += "disk /home"
#order += "ethernet '$zerotierAdapter'"
#order += "wireless _first_"
#order += "ethernet _first_"
#order += "volume master"
#order += "read_file BRIGHTNESS"
#order += "battery all"
order += "tztime local"
#order += "tztime local1"

read_file BRIGHTNESS {
	format = "[☼/%content]"
	#path = "'$HOME'/.config/i3/brightness"
    path = "/sys/class/backlight/intel_backlight/brightness"
	max_characters = 5
	separator = false
	separator_block_width = 1
	align = "center"
    min_width = 1
}

cpu_usage {
	format = "[CPU/%usage]"
	max_threshold = 75
	separator = false
	separator_block_width = 1
	align = "center"
    min_width = 1
}

volume master {
	format = "[♪/%volume]"
	format_muted = "[♪/muted]"
	separator = false
	separator_block_width = 1
	align = "center"
    min_width = 1
}

wireless _first_ {
    format_up = "[W/%ip]"
	format_down = ""
	separator = false
	separator_block_width = 1
	align = "center"
    min_width = 1
}

ethernet _first_ {
    format_up = "[E/%ip]"
    format_down = ""
	separator = false
	separator_block_width = 1
	align = "center"
    min_width = 1
}

ethernet '$zerotierAdapter' {
    format_up = "[Z/%ip]"
    format_down = ""
	separator = false
	separator_block_width = 1
	align = "center"
    min_width = 1
    #diretorio com as redes /proc/sys/net/ipv4/conf/
}

battery all {
    format = "[%status/%percentage]"
    format_percentage = "%.00f%s"
    format_down = ""
	status_chr = "CHR"
    status_bat = "BAT"
    status_unk = "?"
	status_full = "FULL"
	separator = false
	separator_block_width = 1
	align = "center"
    min_width = 1
}

disk "/" {
    format = "[SSD/%used]"
	separator = false
	separator_block_width = 1
	align = "center"
    min_width = 1
}

disk "/home" {
    format = "[HDD/%used]"
	separator = false
	separator_block_width = 1
	align = "center"
    min_width = 1
}

load {
    format = "%1min"
}

memory {
    format = "[RAM/%percentage_used]"
    threshold_degraded = "1G"
    format_degraded = "[RAM/%percentage_used]"
	separator = false
	separator_block_width = 1
	align = "center"
    min_width = 1
}

tztime local {
    format = "[%a.%d %b %H:%M]"
    align = "right"
    min_width = 1
    separator = false
    separator_block_width = 1
}

tztime local1 {
    format = "[%d-%m-%Y %H:%M:%S]"
    align = "right"
    min_width = 1
    separator = false
    separator_block_width = 1
}
' "$HOME/.config/i3status/config"
}