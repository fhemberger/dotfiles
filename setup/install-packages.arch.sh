#!/bin/sh

sudo pacman -Syu
sudo pacman -Sy \
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
sudo pacman -Sy --asdeps \
  unrar \
  unzip

sudo pkgfile --update

# Install arch-audit pacman hook, scans installed packages for known vulnerabilities:
# https://wiki.archlinux.org/index.php/Pacman#Hooks
sudo ln -sf /usr/share/arch-audit/arch-audit.hook /usr/share/libalpm/hooks/arch-audit.hook
