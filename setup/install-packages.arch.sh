#!/bin/sh

sudo pacman -Syu
sudo pacman -Sy aws-cli colordiff ncdu pkgfile zsh
sudo pkgfile --update
