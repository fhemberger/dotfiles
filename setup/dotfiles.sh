#!/usr/bin/env bash
set -euo pipefail

# Copy dotfiles to ~
echo "Copying dotfiles ..."
mkdir -p "$HOME/.config"
cp -r files/.config/{direnv,nano,ranger} "$HOME/.config"
cp files/.{colordiffrc,gitattributes,gitconfig,gitignore_global,inputrc} "$HOME"
cp files/.config/hadolint.yaml "$HOME/.config/hadolint.yaml"
cp -n files/.gitconfig.local "$HOME"
