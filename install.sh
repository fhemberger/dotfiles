#!/usr/bin/env bash
set -euo pipefail

source setup/_detect_os.sh

# if [[ "$(whoami)" != "root" ]]; then
#   sudo -v

#   # Set rights so we donʼt need to use sudo for npm or homebrew
#   sudo mkdir -p /usr/local
#   sudo chown -R "$USER" /usr/local
# fi

echo "Select shell to configure: "
select CONFIGURE_SHELL in zsh fish; do
  break
done

# Detect current OS
[ "$OS" ] && "setup/install-packages.$OS.sh"

setup/dotfiles.sh
setup/${CONFIGURE_SHELL}.sh

if command -v chsh >/dev/null 2>&1; then
  chsh "$USER" -s "$(command -v "$CONFIGURE_SHELL")";
else
  echo >&2 "'chsh' command not found, please change your login shell manually in '/etc/passwd'."
fi
