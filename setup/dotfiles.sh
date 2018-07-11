#!/bin/bash

echo "Installing diff-so-fancy ..."
curl -sSo /usr/local/bin/diff-so-fancy https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy
chmod +x /usr/local/bin/diff-so-fancy

# Copy dotfiles to ~
echo "Copying dotfiles ..."
cp -r files/.zsh "$HOME"
cp files/{.colordiffrc,.gitignore_global,.inputrc,.zshrc} "$HOME"
cp -n files/.gitconfig "$HOME"
touch "$HOME/.extra"
