#!/bin/sh

sudo -v

# Set rights so we don't need to use sudo for npm or homebrew
sudo mkdir -p /usr/local
sudo chown -R $USER /usr/local

setup/homebrew
setup/zsh-setup

# Copy dotfiles to ~
echo "Copying dotfiles ..."
cp -nr .dotfiles ~
cp -n .colordiffrc .gitconfig .gitignore_global .inputrc ~
touch ~/.extra
