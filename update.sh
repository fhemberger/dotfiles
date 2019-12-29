#!/bin/bash
set -euo pipefail

echo "Updating diff-so-fancy ..."
curl -sSo /usr/local/bin/diff-so-fancy https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy
chmod +x /usr/local/bin/diff-so-fancy

echo "Updating external zsh modules ..."
git submodule update --init --recursive --remote --depth=0
cp -r files/.zsh "$HOME"

# Refresh symlinks
setup/zsh.sh
