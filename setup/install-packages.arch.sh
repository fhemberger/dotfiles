#!/bin/sh

sudo pacman -Syu
sudo pacman -Sy aws-cli colordiff cronie htop ncdu pkgfile zsh
sudo pkgfile --update
