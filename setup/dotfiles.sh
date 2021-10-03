#!/usr/bin/env bash
set -euo pipefail

source _detect_os.sh

# Copy dotfiles to ~
echo -e "\nCopying dotfiles ..."
mkdir -p "$HOME/.config"
cp -r files/.config/{direnv,git,nano,ranger} "$HOME/.config"
cp files/.{colordiffrc,inputrc} "$HOME"
cp files/.config/hadolint.yaml "$HOME/.config/hadolint.yaml"

if [ "$OS" == "synology" ]; then
  # Set alternate path for Synology
  echo "/opt/share/nano/*.nanorc" > "$HOME/.config/nano/nanorc"
fi

echo "Add your Git user name and email in ~/.config/git/user"
