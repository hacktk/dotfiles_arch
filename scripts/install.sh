#!/bin/bash

set -eux

# AUR helper (yay)
CUR_PATH=$(pwd)
YAY_PATH="/dev/shm/yay"
mkdir -p $YAY_PATH && cd $YAY_PATH
git clone https://aur.archlinux.org/yay.git ./
makepkg -cirs --needed --noconfirm
cd $CUR_PATH && rm -rf $YAY_PATH

# 1password
CUR_PATH=$(pwd)
ONEPASS_PATH="/dev/shm/onepassword"
mkdir -p $ONEPASS_PATH && cd $ONEPASS_PATH
curl -sS https://downloads.1password.com/linux/keys/1password.asc | gpg --import
git clone https://aur.archlinux.org/1password.git ./
makepkg -cirs --needed --noconfirm
cd $CUR_PATH && rm -rf $ONEPASS_PATH

# bash completion
yay -Syu --needed --noconfirm bash-completion

# docker
yay -Syu --needed --noconfirm docker docker-compose
DOCKER_COMPOSE_VERSION="v2.11.0"
DOCKER_CLI_PLUGINS_PATH="/usr/local/lib/docker/cli-plugins"
sudo mkdir -p $DOCKER_CLI_PLUGINS_PATH
sudo curl -SL https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-linux-x86_64 -o $DOCKER_CLI_PLUGINS_PATH/docker-compose
sudo chmod +x $DOCKER_CLI_PLUGINS_PATH/docker-compose

# downgrade
yay -Syu --needed --noconfirm downgrade

# fcitx, mozc
yay -Syu --needed --noconfirm fcitx fcitx-configtool fcitx-mozc fcitx-qt5

# flat-remix-gnome
CUR_PATH=$(pwd)
FRGN_PATH="/dev/shm/flat-remix-gnome"
mkdir -p $FRGN_PATH && cd $FRGN_PATH
git clone https://aur.archlinux.org/flat-remix-gnome.git ./
makepkg -cirs --needed --noconfirm
cd $CUR_PATH && rm -rf $FRGN_PATH

# flat-remix-gtk
CUR_PATH=$(pwd)
FRGTK_PATH="/dev/shm/flat-remix-gtk"
mkdir -p $FRGTK_PATH && cd $FRGTK_PATH
git clone https://aur.archlinux.org/flat-remix-gtk.git ./
makepkg -cirs --needed --noconfirm
cd $CUR_PATH && rm -rf $FRGTK_PATH

# flat-remix-icon
CUR_PATH=$(pwd)
FRI_PATH="/dev/shm/flat-remix-icon"
mkdir -p $FRI_PATH && cd $FRI_PATH
git clone https://aur.archlinux.org/flat-remix.git ./
makepkg -cirs --needed --noconfirm
cd $CUR_PATH && rm -rf $FRI_PATH

# flyctl
curl -L https://fly.io/install.sh | sh

# gnome-shell-extension-dash-to-dock
yay -Syu --needed --noconfirm gnome-shell-extension-dash-to-dock

# gnome-system-monitor
yay -Syu --needed --noconfirm gnome-system-monitor

# gnome-terminal-fedora
# gnome-terminalとconflictするため、--noconfirmは使えない
yay -Syu --needed gnome-terminal-fedora

# google chrome
yay -Syu --needed --noconfirm google-chrome

# hugo
yay -Syu --needed --noconfirm hugo

# ksnip
yay -Syu --needed --noconfirm ksnip

# noto
yay -Syu --needed --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji

# npm
yay -Syu --needed --noconfirm npm

# peek
yay -Syu --needed --noconfirm peek

# ricty
yay -Syu --needed --noconfirm fontforge ttf-inconsolata ttf-migu ttf-ricty

# samba
yay -Syu --needed --noconfirm samba

# vscode
yay -Syu --needed --noconfirm visual-studio-code-bin

# vlc
yay -Syu --needed --noconfirm vlc

# whois
yay -Syu --needed --noconfirm whois

# xrandr
yay -Syu --needed --noconfirm xorg-xrandr
