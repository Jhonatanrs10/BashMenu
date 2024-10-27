#!/usr/bin/env sh
fastfetchConfig(){
  mkdir -p $HOME/.config/fastfetch
  criarArqv2 '// Inspired by Catnap
{
    "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
    "logo": {
        "type": "none",
        "padding": {
        "top": 4,
	      "left": 4
        }
    },
    "display": {
        "separator": " "
    },
    "modules": [
        {
            "key": "╭────────╮",
            "type": "custom"
        },
         {
            "key": "│{#31}host    {#keys}│",
            "type": "host",
            "format": "{name}{?vendor} ({vendor}){?}"
        },
        {
            "key": "│{#32}user    {#keys}│",
            "type": "title",
            "format": "{host-name}@{user-name}"
        },
        {
            "key": "│{#33}distro  {#keys}│",
            "type": "os"
        },
        {
            "key": "│{#34}kernel  {#keys}│",
            "type": "kernel"
        },
        {
            "key": "│{#35}packages{#keys}│",
            "type": "packages"
        },
        {
            "key": "│{#36}uptime  {#keys}│",
            "type": "uptime"
        },
        {
            "key": "│{#31}term    {#keys}│",
            "type": "terminal"
        },
        {
            "key": "│{#32}shell   {#keys}│",
            "type": "shell"
        },
        {
            "key": "│{#33}display {#keys}│",
            "type": "display"
        },
        {
            "key": "│{#34}de      {#keys}│",
            "type": "de"
        },
        {
            "key": "│{#35}wm      {#keys}│",
            "type": "wm"
        },
        {
            "key": "│{#36}wmtheme {#keys}│",
            "type": "wmtheme"
        },
        {
            "key": "│{#31}theme   {#keys}│",
            "type": "theme"
        },
        {
            "key": "│{#32}icons   {#keys}│",
            "type": "icons"
        },
        {
            "key": "│{#33}font    {#keys}│",
            "type": "font"
        },
        {
            "key": "│{#34}cursor  {#keys}│",
            "type": "cursor"
        },
        {
            "key": "│{#35}cpu     {#keys}│",
            "type": "cpu",
            "showPeCoreCount": true
        },
	      {
            "key": "│{#36}gpu     {#keys}│",
            "type": "gpu",
            "showPeCoreCount": true
        },
        {
            "key": "│{#31}memory  {#keys}│",
            "type": "memory"
        },
        {
            "key": "│{#32}swap    {#keys}│",
            "type": "swap"
        },
        {
            "key": "│{#33}disk    {#keys}│",
            "type": "disk",
            "folders": "/"
        },
        {
            "key": "│{#34}battery {#keys}│",
            "type": "battery"
        },
        {
            "key": "│{#35}power   {#keys}│",
            "type": "poweradapter"
        },
        {
            "key": "│{#36}network {#keys}│",
            "type": "localip",
            "format": "{ipv4} ({ifname})"
        },
        {
            "key": "╰────────╯",
            "type": "custom"
        }
    ]
}' "$HOME/.config/fastfetch/config.jsonc"
}