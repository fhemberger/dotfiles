#!/bin/sh

sudo pacman -Syu
sudo pacman -Sy \
  colordiff \
  cronie \
  dnsutils \
  fzf \
  htop \
  ncdu \
  pkgfile \
  unp \
  zsh
sudo pkgfile --update
