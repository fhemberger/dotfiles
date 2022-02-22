curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fish -c 'set fish_greeting ""'
fish -c 'fisher add jethrokuan/fzf'

# fzf has no fuzzy completion for fish
case "$OS" in
  "arch")
    echo -e "source /usr/share/fzf/key-bindings.fish" >> ~/.config/fish/config.fish
    ;;
  "macos")
    "$(brew --prefix)/opt/fzf/install" --key-bindings --update-rc --no-bash --no-zsh
    ;;
  "synology")
    version="$(curl -fsS "https://api.github.com/repos/junegunn/fzf/releases/latest" | jq -r '.tag_name')"
    mkdir ~/.fzf
    curl -fsSL "https://github.com/junegunn/fzf/archive/refs/tags/${version}.tar.gz" | tar -xzf - -C ~/.fzf --strip-components=1
    ~/.fzf/install --key-bindings --update-rc --no-bash --no-zsh
    ;;
esac