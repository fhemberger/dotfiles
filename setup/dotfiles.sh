#!/usr/bin/env bash
set -euo pipefail

# Copy dotfiles to ~
echo -e "\nCopying dotfiles ..."
mkdir -p "$HOME/.config"
cp -r files/.config/{direnv,git,nano,ranger} "$HOME/.config"
cp files/.{colordiffrc,inputrc} "$HOME"
cp files/.config/hadolint.yaml "$HOME/.config/hadolint.yaml"

echo "Add your Git user name and email in ~/.config/git/user"
