#!/bin/bash
set -euo pipefail

echo "Updating external zsh modules ..."
git submodule update --init --recursive --remote --depth=1

setup/dotfiles.sh
setup/zsh.sh
