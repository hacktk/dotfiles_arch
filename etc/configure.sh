#!/bin/bash

# yay
YAY_PATH="/tmp/yay"
mkdir -p $YAY_PATH && cd $YAY_PATH
git clone https://aur.archlinux.org/yay.git ./
makepkg -si
cd ~ && rm -rf $YAY_PATH

# gsettings
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
