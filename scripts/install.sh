#!/bin/bash

set -eux

# AUR helper (yay)
CUR_PATH=$(pwd)
YAY_PATH="/tmp/yay"
mkdir -p $YAY_PATH && cd $YAY_PATH
git clone https://aur.archlinux.org/yay.git ./
makepkg -cirs --needed --noconfirm
cd $CUR_PATH && rm -rf $YAY_PATH

# aws-cli
yay -S --needed --noconfirm aws-cli

# bash completion
yay -S --needed --noconfirm bash-completion

# dbus-action
yay -S --needed --noconfirm dbus-action

# docker
yay -S --needed --noconfirm docker docker-compose

# fcitx, mozc
yay -S --needed --noconfirm fcitx fcitx-configtool fcitx-mozc fcitx-qt5

# gestures
yay -S --needed --noconfirm libinput-gestures

# gnome-shell-extension-dash-to-dock
yay -S --needed --noconfirm gnome-shell-extension-dash-to-dock

# gnome-system-monitor
yay -S --needed --noconfirm gnome-system-monitor

# google chrome
yay -S --needed --noconfirm google-chrome

# hugo
yay -S --needed --noconfirm hugo

# ksnip
yay -S --needed --noconfirm ksnip

# noto
yay -S --needed --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji

# npm
yay -S --needed --noconfirm npm

# peek
yay -S --needed --noconfirm peek

# php
yay -S --needed --noconfirm php

# samba
yay -S --needed --noconfirm samba

# ricty
yay -S --needed --noconfirm fontforge ttf-inconsolata ttf-migu ttf-ricty

# terraform
yay -S --needed --noconfirm terraform

# vscode
yay -S --needed --noconfirm visual-studio-code-bin

# vlc
yay -S --needed --noconfirm vlc

# whois
yay -S --needed --noconfirm whois

# xrandr
yay -S --needed --noconfirm xorg-xrandr

# xdotool
yay -S --needed --noconfirm xdotool

# zoom
yay -S --needed --noconfirm zoom
