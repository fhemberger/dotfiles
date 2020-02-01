#!/bin/sh

sudo apt-get update
sudo apt-get install -y \
  colordiff \
  curl \
  htop \
  ncdu \
  unp \
  zsh

# Disable Ubuntu motd spam
# https://eklitzke.org/disabling-ubuntu-motd-spam
sudo sed -i 's/^ENABLED=.*/ENABLED=0/' /etc/default/motd-news
