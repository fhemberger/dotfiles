#!/bin/sh

sudo pacman -Syu
sudo pacman -S --noconfirm \
  arch-audit \
  bat \
  colordiff \
  cronie \
  dnsutils \
  fzf \
  htop \
  ncdu \
  pkgfile \
  unp \
  wget \
  zsh

# Optional dependencies for `unp`
sudo pacman -S --noconfirm --asdeps \
  unrar \
  unzip

sudo pkgfile --update

# Install arch-audit pacman hook, scans installed packages for known vulnerabilities:
# https://wiki.archlinux.org/index.php/Pacman#Hooks
sudo ln -sf /usr/share/arch-audit/arch-audit.hook /usr/share/libalpm/hooks/arch-audit.hook

# Disable sudo password for current user
(
cat <<-EOF
# User rules for $USER
$USER ALL=(ALL) NOPASSWD:ALL
EOF
) | sudo tee "/etc/sudoers.d/$USER" > /dev/null
