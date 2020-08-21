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
