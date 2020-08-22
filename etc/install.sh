#!/bin/bash

set -eux

CUR_PATH=$(pwd)

# aws-cli
sudo pacman -S --needed --noconfirm aws-cli

# bash completion
sudo pacman -S --needed --noconfirm bash-completion

# dash-to-dock
DOCK_PATH="/tmp/dash-to-dock"
mkdir -p $DOCK_PATH && cd $DOCK_PATH
git clone https://aur.archlinux.org/gnome-shell-extension-dash-to-dock.git ./
makepkg -cirs --needed --noconfirm
cd $CUR_PATH && rm -rf $DOCK_PATH

# docker
sudo pacman -S --needed --noconfirm docker docker-compose

# fcitx, mozc
sudo pacman -S --needed --noconfirm fcitx fcitx-configtool fcitx-mozc fcitx-qt5

# git
sudo pacman -S --needed --noconfirm git

# google chrome
CHROME_PATH="/tmp/chrome"
mkdir -p $CHROME_PATH && cd $CHROME_PATH
git clone https://aur.archlinux.org/google-chrome.git ./
makepkg -cirs --needed --noconfirm
cd $CUR_PATH && rm -rf $CHROME_PATH

# hugo
sudo pacman -S --needed --noconfirm hugo

# ricty
sudo pacman -S --needed --noconfirm fontforge ttf-inconsolata

MIGU_PATH="/tmp/migu"
mkdir -p $MIGU_PATH && cd $MIGU_PATH
git clone https://aur.archlinux.org/ttf-migu.git ./
makepkg -cirs --needed --noconfirm
cd $CUR_PATH && rm -rf $MIGU_PATH

RICTY_PATH="/tmp/ricty"
mkdir -p $RICTY_PATH && cd $RICTY_PATH
git clone https://aur.archlinux.org/ttf-ricty.git ./
makepkg -cirs --needed --noconfirm
cd $CUR_PATH && rm -rf $RICTY_PATH

# terraform
sudo pacman -S --needed --noconfirm terraform

# vscode
sudo pacman -S --needed --noconfirm code

# vlc
sudo pacman -S --needed --noconfirm vlc

# xrandr
sudo pacman -S --needed --noconfirm xorg-xrandr
