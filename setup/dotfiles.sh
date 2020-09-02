#!/usr/bin/env bash
set -euo pipefail

# Copy dotfiles to ~
echo "Copying dotfiles ..."
mkdir -p "$HOME/.config"
cp files/.{colordiffrc,gitattributes,gitconfig,gitignore_global,inputrc} "$HOME"
cp -n files/.gitconfig.local "$HOME"
touch "$HOME/.extra"
