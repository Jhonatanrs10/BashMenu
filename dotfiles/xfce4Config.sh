#!/usr/bin/env sh
xfce4-config(){
    criarArqv2 '<?xml version="1.0" encoding="UTF-8"?>

<channel name="xfce4-panel" version="1.0">
  <property name="configver" type="int" value="2"/>
  <property name="panels" type="array">
    <value type="int" value="1"/>
    <property name="dark-mode" type="bool" value="true"/>
    <property name="panel-1" type="empty">
      <property name="position" type="string" value="p=8;x=683;y=753"/>
      <property name="length" type="uint" value="100"/>
      <property name="position-locked" type="bool" value="true"/>
      <property name="icon-size" type="uint" value="16"/>
      <property name="size" type="uint" value="34"/>
      <property name="plugin-ids" type="array">
        <value type="int" value="16"/>
        <value type="int" value="22"/>
        <value type="int" value="3"/>
        <value type="int" value="5"/>
        <value type="int" value="6"/>
        <value type="int" value="8"/>
        <value type="int" value="9"/>
        <value type="int" value="10"/>
        <value type="int" value="11"/>
        <value type="int" value="12"/>
        <value type="int" value="13"/>
        <value type="int" value="7"/>
      </property>
      <property name="background-style" type="uint" value="0"/>
      <property name="background-rgba" type="array">
        <value type="double" value="0"/>
        <value type="double" value="0"/>
        <value type="double" value="0"/>
        <value type="double" value="1"/>
      </property>
    </property>
  </property>
  <property name="plugins" type="empty">
    <property name="plugin-3" type="string" value="separator">
      <property name="expand" type="bool" value="true"/>
      <property name="style" type="uint" value="0"/>
    </property>
    <property name="plugin-5" type="string" value="separator">
      <property name="style" type="uint" value="0"/>
    </property>
    <property name="plugin-6" type="string" value="systray">
      <property name="square-icons" type="bool" value="true"/>
      <property name="known-legacy-items" type="array">
        <value type="string" value="networkmanager applet"/>
        <value type="string" value="xfce4-power-manager"/>
        <value type="string" value="wi-fi network connection “davi3” active: davi3 (75%)"/>
        <value type="string" value="wi-fi network connection “davi3” active: davi3 (65%)"/>
        <value type="string" value="blueberry-tray.py"/>
        <value type="string" value="wi-fi network connection “davi3” active: davi3 (66%)"/>
        <value type="string" value="wi-fi network connection “casa 01” active: casa 01 (61%)"/>
        <value type="string" value="wi-fi network connection “casa 01” active: casa 01 (100%)"/>
        <value type="string" value="wi-fi network connection “casa 01” active: casa 01 (76%)"/>
        <value type="string" value="wi-fi network connection “casa 01” active: casa 01 (80%)"/>
        <value type="string" value="wi-fi network connection “casa 01” active: casa 01 (89%)"/>
        <value type="string" value="wi-fi network connection “casa 01” active: casa 01 (79%)"/>
      </property>
      <property name="known-items" type="array">
        <value type="string" value="KDE Connect Indicator"/>
        <value type="string" value="blueman"/>
      </property>
    </property>
    <property name="plugin-8" type="string" value="pulseaudio">
      <property name="enable-keyboard-shortcuts" type="bool" value="true"/>
      <property name="show-notifications" type="bool" value="true"/>
      <property name="known-players" type="string" value="Chrome;org.kde.kdeconnect.app"/>
    </property>
    <property name="plugin-9" type="string" value="power-manager-plugin"/>
    <property name="plugin-10" type="string" value="notification-plugin"/>
    <property name="plugin-11" type="string" value="separator">
      <property name="style" type="uint" value="0"/>
    </property>
    <property name="plugin-12" type="string" value="clock">
      <property name="timezone" type="string" value="America/Sao_Paulo"/>
      <property name="command" type="string" value=""/>
    </property>
    <property name="plugin-13" type="string" value="separator">
      <property name="style" type="uint" value="0"/>
    </property>
    <property name="plugin-7" type="string" value="showdesktop"/>
    <property name="plugin-16" type="string" value="whiskermenu">
      <property name="recent" type="array">
        <value type="string" value="code-oss.desktop"/>
        <value type="string" value="bitwarden.desktop"/>
        <value type="string" value="xfce4-power-manager-settings.desktop"/>
        <value type="string" value="org.kde.kdeconnect.nonplasma.desktop"/>
        <value type="string" value="org.kde.kdeconnect.app.desktop"/>
        <value type="string" value="xfce-settings-manager.desktop"/>
        <value type="string" value="xfce4-taskmanager.desktop"/>
        <value type="string" value="Alacritty.desktop"/>
        <value type="string" value="google-chrome.desktop"/>
      </property>
      <property name="button-icon" type="string" value="org.xfce.panel.whiskermenu"/>
    </property>
    <property name="plugin-22" type="string" value="docklike"/>
  </property>
</channel>' "$HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml"
}