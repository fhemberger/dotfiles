#!/bin/sh

set -euo pipefail
sudo -v

if [[ `uname` == "Darwin" ]]; then
    # Set rights so we don't need to use sudo for npm or homebrew
    sudo mkdir -p /usr/local
    sudo chown -R $USER /usr/local

    setup/macos/install-packages
fi

# Arch
if [[ -f /etc/manjaro-release ]]; then
    setup/arch/install-packages
fi

# CentOS
# if [[ -f /etc/centos-release ]]; then
# fi

# Debian/Ubuntu
# if [[ -f /etc/os-release ]]; then
# fi

setup/zsh-settings
setup/dotfiles
