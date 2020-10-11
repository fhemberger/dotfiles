#!/usr/bin/env bash
set -euo pipefail

mkdir -p "$HOME/.config/fish"
cp -rv files/.config/fish "$HOME/.config"

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fish -c 'set fish_greeting ""'
fish -c 'fisher add rafaelrinaldi/pure'
fish -c 'fisher add jethrokuan/fzf'
