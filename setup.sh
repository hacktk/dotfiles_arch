#!/bin/bash

set -eux

# repository download
DOT_PATH="$HOME/repo/dotfiles_arch"
if [ ! -d "$DOT_PATH" ]; then
    sudo pacman -S --needed --noconfirm git
    git clone git@github.com:hacktk/dotfiles_arch.git "$DOT_PATH"
else
    echo "$DOT_PATH already downloaded. Updating..."
    cd "$DOT_PATH"
    git stash
    git checkout master
    git pull origin master
    echo
fi
cd "$DOT_PATH"

# install packages
scripts/install.sh
echo

# deploy dotfiles
scripts/deploy.sh
echo

# configure environments
scripts/configure.sh
echo

echo "setup finished."
