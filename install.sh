#!/bin/bash
set -euo pipefail

detect_os () {
  if [[ "$(uname)" == "Darwin" ]]; then echo "macos"; return 0; fi
  if [[ -d /.syno ]]; then echo "synology"; return 0; fi

  if [[ -f /etc/os-release ]]; then
    source /etc/os-release
    # e.g. for ArchLinux ARM
    # ID=archarm
    # ID_LIKE=arch
    echo "${ID_LIKE:-ID}"
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

# Enable fzf shell integration on macOS
case "$OS" in
  "arch")
    echo -e "source /usr/share/fzf/key-bindings.zsh\nsource /usr/share/fzf/completion.zsh" >> ~/.zshrc
    ;;
  "macos")
    "$(brew --prefix)/opt/fzf/install" --key-bindings --completion --update-rc
    ;;
  "synology")
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --key-bindings --completion --update-rc
    ;;
esac
echo "export FZF_DEFAULT_COMMAND=\"find . -type f -not -path '*/\.git/*'\"" >> ~/.zshrc
