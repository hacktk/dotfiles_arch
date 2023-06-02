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

# audacity
yay -S --needed --noconfirm audacity

# bash completion
yay -S --needed --noconfirm bash-completion

# dbus-action
yay -S --needed --noconfirm dbus-action

# docker
yay -S --needed --noconfirm docker docker-compose
DOCKER_COMPOSE_VERSION="v2.11.0"
DOCKER_CLI_PLUGINS_PATH="/usr/local/lib/docker/cli-plugins"
sudo mkdir -p $DOCKER_CLI_PLUGINS_PATH
sudo curl -SL https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-linux-x86_64 -o $DOCKER_CLI_PLUGINS_PATH/docker-compose
sudo chmod +x $DOCKER_CLI_PLUGINS_PATH/docker-compose

# downgrade
yay -S --needed --noconfirm downgrade

# fcitx, mozc
yay -S --needed --noconfirm fcitx fcitx-configtool fcitx-mozc fcitx-qt5

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

# gestures
yay -S --needed --noconfirm libinput-gestures

# gnome-shell-extension-dash-to-dock
yay -S --needed --noconfirm gnome-shell-extension-dash-to-dock

# gnome-system-monitor
yay -S --needed --noconfirm gnome-system-monitor

# gnome-terminal-fedora
# gnome-terminalとconflictするため、--noconfirmは使えない
yay -S --needed gnome-terminal-fedora

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

# samba
yay -S --needed --noconfirm samba

# UDEV Gothic
UDEV_GOTHIC_VERSION="v1.3.0"
UDEV_GOTHIC_PATH="/dev/shm/udev-gothic"
CUR_PATH=$(pwd)
mkdir -p $UDEV_GOTHIC_PATH && cd $UDEV_GOTHIC_PATH
curl -L https://github.com/yuru7/udev-gothic/releases/download/$UDEV_GOTHIC_VERSION/UDEVGothic_$UDEV_GOTHIC_VERSION.zip -o ./UDEVGothic.zip
sudo unzip ./UDEVGothic.zip -d /usr/share/fonts/
cd $CUR_PATH && rm -rf $UDEV_GOTHIC_PATH

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
