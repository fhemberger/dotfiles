#!/usr/bin/env bash
set -euo pipefail

# Copy dotfiles to ~
echo "Copying dotfiles ..."
cp -r files/.zsh "$HOME"
cp files/.{colordiffrc,gitconfig,gitignore_global,inputrc,zshrc} "$HOME"
cp -n files/.gitconfig.local "$HOME"
touch "$HOME/.extra"
