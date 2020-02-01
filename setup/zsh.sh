#!/bin/sh

# Get external autocompletions
cp -r files/.zsh "$HOME"
curl -SsLo "$HOME/.zsh/external/_docker-machine" https://raw.githubusercontent.com/docker/machine/master/contrib/completion/zsh/_docker-machine
curl -SsLo "$HOME/.zsh/external/_docker-compose" https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose
curl -SsLo "$HOME/.zsh/external/_docker" https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker
curl -SsLo "$HOME/.zsh/external/_terraform" https://raw.githubusercontent.com/hashicorp/terraform/master/contrib/zsh-completion/_terraform

# Setup zfunctions
mkdir -p "$HOME/.zsh/zfunctions"
ln -sf "$HOME/.zsh/external/spaceship/spaceship.zsh" "$HOME/.zsh/zfunctions/prompt_spaceship_setup" 2>/dev/null

ln -sf "$HOME/.zsh/external/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh" "$HOME/.zsh/zfunctions/syntax-highlighting" 2>/dev/null
ln -sf "$HOME/.zsh/external/zsh-you-should-use/you-should-use.plugin.zsh" "$HOME/.zsh/zfunctions/you-should-use" 2>/dev/null
ln -sf "$HOME/.zsh/external/zsh-kubectl-prompt/kubectl.zsh" "$HOME/.zsh/zfunctions/kubectl" 2>/dev/null
