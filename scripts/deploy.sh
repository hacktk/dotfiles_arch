#!/bin/bash

set -eux

DOT_PATH="$HOME/repo/dotfiles_arch"

if [ ! -d "$DOT_PATH" ]; then
    echo "Error: Directory $DOT_PATH does not exist."
    exit 1
fi
cd "$DOT_PATH" || exit 1

# home dir
for file in .??*; do
    [[ "$file" = ".git" ]] && continue
    ln -fvs "$DOT_PATH/$file" "$HOME/$file"
done

# gestures
sudo gpasswd -a $USER input
ln -fvs "$DOT_PATH/gestures/libinput-gestures.conf" "$HOME/.config/libinput-gestures.conf"
libinput-gestures-setup autostart

# git
sudo ln -fvs "/usr/share/git/diff-highlight/diff-highlight" "/usr/local/bin/diff-highlight"

# ricty
fc-cache -fv

# terraform
mkdir -p "$HOME/.terraform.d/plugin-cache"

# vscode
cat "$DOT_PATH/vscode/extensions" | while read line
do
    code --install-extension $line
done
code --list-extensions > "$DOT_PATH/vscode/extensions"
VSC_PATH="$HOME/.config/Code/User"
ln -fvs "$DOT_PATH/vscode/settings.json" "$VSC_PATH/settings.json"
ln -fvs "$DOT_PATH/vscode/keybindings.json" "$VSC_PATH/keybindings.json"
