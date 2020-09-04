#!/usr/bin/env bash
set -euo pipefail

mkdir -p "$HOME/.config/zsh"
cp -r files/.config/zsh "$HOME/.config/zsh"
cp files/.zshrc "$HOME"

mkdir -p "$HOME/.config/zsh/cache"

# Get external autocompletions
cp -r files/.config/zsh "$HOME"
curl -SsLo "$HOME/.config/zsh/external/_docker-compose" https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose
curl -SsLo "$HOME/.config/zsh/external/_docker" https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker

# Setup zfunctions
mkdir -p "$HOME/.config/zsh/zfunctions"
ln -sf "$HOME/.config/zsh/external/spaceship/spaceship.zsh" "$HOME/.config/zsh/zfunctions/prompt_spaceship_setup" 2>/dev/null
ln -sf "$HOME/.config/zsh/external/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh" "$HOME/.config/zsh/zfunctions/syntax-highlighting" 2>/dev/null
ln -sf "$HOME/.config/zsh/external/zsh-kubectl-prompt/kubectl.zsh" "$HOME/.config/zsh/zfunctions/kubectl" 2>/dev/null

source setup/_detect_os.sh
case "$OS" in
  "arch")
    echo -e "source /usr/share/fzf/key-bindings.zsh\nsource /usr/share/fzf/completion.zsh" >> ~/.zshrc
    ;;
  "macos")
    "$(brew --prefix)/opt/fzf/install" --key-bindings --completion --update-rc
    ;;
  "synology")
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --key-bindings --completion --update-rc
    ;;
esac
echo "export FZF_DEFAULT_COMMAND=\"find . -type f -not -path '*/\.git/*'\"" >> ~/.zshrc

if [ "$OS" == "synology" ] && [ "$(echo "$PATH" | grep "/opt" -c)" -eq 0 ]; then
  # shellcheck disable=SC2016
  echo 'export PATH="/opt/bin:/opt/sbin:$PATH"' >> ~/.extra
fi
