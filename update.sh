#!/usr/bin/env bash
set -euo pipefail

source setup/_detect_os.sh

if [ "$OS" == "synology" ] && [ "$(echo "$PATH" | grep "/opt" -c)" -eq 0 ]; then
  export PATH="/opt/bin:/opt/sbin:$PATH"
fi

echo "Updating external modules ..."
git submodule update --init --recursive --remote --depth=1

setup/dotfiles.sh
setup/zsh.sh
