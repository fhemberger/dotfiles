#!/usr/bin/env bash
set -euo pipefail

source setup/_detect_os.sh

if [ "$OS" == "synology" ] && [ "$(echo "$PATH" | grep "/opt" -c)" -eq 0 ]; then
  export PATH="/opt/bin:/opt/sbin:$PATH"
fi

echo "Updating external modules ..."
git submodule update --init --recursive --remote --depth=1

echo "Select shell to configure: "
select CONFIGURE_SHELL in zsh fish; do
  break
done

setup/dotfiles.sh
setup/${CONFIGURE_SHELL}.sh
