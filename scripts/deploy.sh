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

# docker
sudo gpasswd -a $USER docker
sudo systemctl enable docker

# font
fc-cache -fv

# git
sudo ln -fvs "/usr/share/git/diff-highlight/diff-highlight" "/usr/local/bin/diff-highlight"

# samba
sudo ln -fvs "$DOT_PATH/samba/smb.conf" "/etc/samba/smb.conf"
sudo systemctl enable smb nmb
sudo pdbedit -a -u hacktk

# textlint (/usr/lib/node_modules/ is owned by root, so sudo is required)
sudo npm install -g textlint

# vscode
cat "$DOT_PATH/vscode/extensions" | while read line
do
    code --install-extension $line
done
code --list-extensions > "$DOT_PATH/vscode/extensions"
VSC_PATH="$HOME/.config/Code/User"
ln -fvs "$DOT_PATH/vscode/settings.json" "$VSC_PATH/settings.json"
ln -fvs "$DOT_PATH/vscode/keybindings.json" "$VSC_PATH/keybindings.json"
