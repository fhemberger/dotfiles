#!/usr/bin/env bash
set -euo pipefail

sudo pacman -S --noconfirm \
  alacritty \
  bc \
  dunst \
  feh \
  i3-gaps \
  i3lock-color \
  libnotify \
  noto-fonts \
  numlockx \
  picom \
  python-pywal \
  redshift \
  rofi \
  ttf-dejavu \
  ttf-fira-mono \
  ttf-font-awesome \
  xorg-server \
  xorg-xinit

yay -S --answerdiff=None --noconfirm betterlockscreen

# https://wiki.manjaro.org/index.php?title=Improve_Font_Rendering
(
cat <<-EOF
<match target="font">
  <edit name="autohint" mode="assign">
    <bool>true</bool>
  </edit>
  <edit name="hinting" mode="assign">
    <bool>true</bool>
  </edit>
  <edit mode="assign" name="hintstyle">
    <const>hintslight</const>
  </edit>
  <edit mode="assign" name="lcdfilter">
   <const>lcddefault</const>
 </edit>
</match>
EOF
) | sudo tee /etc/fonts/local.conf > /dev/null
