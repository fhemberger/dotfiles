#!/bin/bash
set -euo pipefail

source setup/_detect_os.sh

# if [[ "$(whoami)" != "root" ]]; then
#   sudo -v

#   # Set rights so we donʼt need to use sudo for npm or homebrew
#   sudo mkdir -p /usr/local
#   sudo chown -R "$USER" /usr/local
# fi

# Detect current OS
[ "$OS" ] && "setup/install-packages.$OS.sh"

setup/dotfiles.sh
setup/zsh.sh
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
