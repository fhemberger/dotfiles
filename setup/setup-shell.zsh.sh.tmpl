mkdir -p "$HOME/.config/zsh/cache"

# Setup zfunctions
mkdir -p "$HOME/.config/zsh/zfunctions"
ln -sf "$HOME/.config/zsh/external/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh" "$HOME/.config/zsh/zfunctions/syntax-highlighting" 2>/dev/null
ln -sf "$HOME/.config/zsh/external/zsh-kubectl-prompt/kubectl.zsh" "$HOME/.config/zsh/zfunctions/kubectl" 2>/dev/null

case "$OS" in
  "arch")
    echo -e "source /usr/share/fzf/key-bindings.zsh\nsource /usr/share/fzf/completion.zsh" >> ~/.zshrc
    ;;
  "macos")
    "$(brew --prefix)/opt/fzf/install" --key-bindings --completion --update-rc --no-bash --no-fish
    ;;
  "synology")
    version="$(curl -fsS "https://api.github.com/repos/junegunn/fzf/releases/latest" | jq -r '.tag_name')"
    mkdir ~/.fzf
    curl -fsSL "https://github.com/junegunn/fzf/archive/refs/tags/${version}.tar.gz" | tar -xzf - -C ~/.fzf --strip-components=1
    ~/.fzf/install --key-bindings --completion --update-rc --no-bash --no-fish
    ;;
esac

if [ "$OS" == "synology" ]; then
  # shellcheck disable=SC2016
  echo 'export PATH="/usr/local/bin:/opt/bin:/opt/sbin:$PATH"' >> ~/.extra
fi
