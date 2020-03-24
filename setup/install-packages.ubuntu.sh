#!/bin/sh

sudo apt-get update
sudo apt-get install -y \
  bat \
  colordiff \
  curl \
  fzf \
  htop \
  ncdu \
  unp \
  zsh

# Disable Ubuntu motd spam
# https://eklitzke.org/disabling-ubuntu-motd-spam
sudo sed -i 's/^ENABLED=.*/ENABLED=0/' /etc/default/motd-news

# Disable sudo password for current user
(
cat <<-EOF
# User rules for $USER
$USER ALL=(ALL) NOPASSWD:ALL
EOF
) | sudo tee "/etc/sudoers.d/$USER" > /dev/null
