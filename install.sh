#!/bin/bash
set -euo pipefail

detect_os () {
  if [[ "$(uname)" == "Darwin" ]]; then echo "macos"; return 0; fi
  if [[ -d /.syno ]]; then echo "synology"; return 0; fi

  if [[ -f /etc/os-release ]]; then
    source /etc/os-release
    echo "$ID"
  fi
}

# if [[ "$(whoami)" != "root" ]]; then
#   sudo -v

#   # Set rights so we donʼt need to use sudo for npm or homebrew
#   sudo mkdir -p /usr/local
#   sudo chown -R "$USER" /usr/local
# fi

# Detect current OS
readonly OS="$(detect_os)"
[ "$OS" ] && "setup/install-packages.$OS.sh"

setup/dotfiles.sh
setup/zsh.sh
setup/sublime-text.sh
chsh "$USER" -s "$(command -v zsh)";
