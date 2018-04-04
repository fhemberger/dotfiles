#!/bin/sh

sudo pacman -Syu
sudo pacman -Sy aws-cli colordiff git docker ncdu pkgfile zsh
sudo pkgfile --update
