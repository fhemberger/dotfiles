#!/usr/bin/env bash
set -euo pipefail

mkdir -p "$HOME/.config/.zsh"
cp -r files/.config/.zsh "$HOME/.config/.zsh"
cp files/.zshrc "$HOME"

mkdir -p "$HOME/.config/.zsh/cache"

# Get external autocompletions
cp -r files/.config/.zsh "$HOME"
curl -SsLo "$HOME/.config/.zsh/external/_docker-compose" https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose
curl -SsLo "$HOME/.config/.zsh/external/_docker" https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker

# Setup zfunctions
mkdir -p "$HOME/.config/.zsh/zfunctions"
ln -sf "$HOME/.config/.zsh/external/spaceship/spaceship.zsh" "$HOME/.config/.zsh/zfunctions/prompt_spaceship_setup" 2>/dev/null
ln -sf "$HOME/.config/.zsh/external/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh" "$HOME/.config/.zsh/zfunctions/syntax-highlighting" 2>/dev/null
ln -sf "$HOME/.config/.zsh/external/zsh-kubectl-prompt/kubectl.zsh" "$HOME/.config/.zsh/zfunctions/kubectl" 2>/dev/null
