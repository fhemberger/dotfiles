#!/usr/bin/env bash
set -euo pipefail

mkdir -p "$HOME/.config"
cp -r files/.config/{alacritty,i3,polybar,rofi} "$HOME/.config"
cp files/.config/picom.conf "$HOME/.config/picom.conf"
cp files/.{xinitrc,Xresources,Xsessionrc} "$HOME"

xrdb -merge ~/.Xresources
