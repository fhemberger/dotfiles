#!/usr/bin/env bash
set -euo pipefail

mkdir -p "$HOME/.config/.fish"
cp -r files/.config/.fish "$HOME/.config/.fish"

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fish
set fish_greeting
fisher add rafaelrinaldi/pure
fisher add jethrokuan/fzf
