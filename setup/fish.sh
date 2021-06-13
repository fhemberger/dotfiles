#!/usr/bin/env bash
set -euo pipefail

mkdir -p "$HOME/.config/fish"
cp -rv files/.config/fish "$HOME/.config"

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fish -c 'set fish_greeting ""'
fish -c 'fisher add jethrokuan/fzf'

# fzf has no fuzzy completion for fish
source setup/_detect_os.sh
case "$OS" in
  "arch")
    echo -e "source /usr/share/fzf/key-bindings.fish" >> ~/.config/fish/config.fish
    ;;
  "macos")
    "$(brew --prefix)/opt/fzf/install" --key-bindings --update-rc --no-bash --no-zsh
    ;;
  "synology")
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --key-bindings --update-rc --no-bash --no-zsh
    ;;
esac
