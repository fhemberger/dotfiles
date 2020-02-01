#!/bin/sh

sudo pacman -Syu
sudo pacman -Sy \
  colordiff \
  cronie \
  htop \
  ncdu \
  pkgfile \
  unp \
  zsh
sudo pkgfile --update
