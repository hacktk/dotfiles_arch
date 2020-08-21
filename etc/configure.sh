#!/bin/bash

set -eux

# google chrome
CUR_PATH=$(pwd)
CHROME_PATH="/tmp/chrome"
mkdir -p $CHROME_PATH && cd $CHROME_PATH
git clone https://aur.archlinux.org/google-chrome.git ./
makepkg -sri
cd $CUR_PATH && rm -rf $CHROME_PATH

# gsettings
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
