#!/usr/bin/env bash
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

if command -v chsh >/dev/null 2>&1; then
  chsh "$USER" -s "$(command -v zsh)";
else
  echo >&2 "'chsh' command not found, please change your login shell manually in '/etc/passwd'."
fi

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

if [ "$OS" == "synology" ] && [ "$(echo "$PATH" | grep "/opt" -c)" -eq 0 ]; then
  echo 'export PATH="/opt/bin:/opt/sbin:$PATH"' >> ~/.extra
fi
