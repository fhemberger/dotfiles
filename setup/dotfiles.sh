#!/bin/bash

# Copy dotfiles to ~
echo "Copying dotfiles ..."
cp -r files/.zsh "$HOME"
cp files/{.colordiffrc,.gitignore_global,.inputrc,.zshrc} "$HOME"
cp -n files/.gitconfig "$HOME"
touch "$HOME/.extra"
