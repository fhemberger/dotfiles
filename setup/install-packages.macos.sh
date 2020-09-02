#!/usr/bin/env bash
set -euo pipefail

# Install Homebrew if needed
if [ ! -f /usr/local/bin/brew ]; then
  echo "Installing homebrew ..."
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"
else
  echo "homebrew already installed, trying to update ..."
  # Make sure we’re using the latest Homebrew and installed
  brew update && brew upgrade
fi


if [ -f /usr/local/bin/brew ]; then
  # Install more recent versions of some OS X tools
  brew tap homebrew/dupes
  brew link openssh --force

  # Install wget with IRI support
  brew install wget --enable-iri

  # Install everything else
  brew install \
    bat \
    colordiff \
    coreutils \
    diffutils \
    direnv \
    ext4fuse \
    findutils \
    fzf \
    gawk \
    git \
    git-delta \
    git-extras \
    gnu-sed \
    gnu-tar \
    grep \
    grepcidr \
    htop \
    iproute2mac \
    jq \
    n \
    nano \
    ncdu \
    openssl \
    openssh \
    python-yq \
    ssh-copy-id \
    tree \
    unp \
    wakeonlan \
    watch \
    zsh

  brew cask install \
    1password \
    alfred \
    appcleaner \
    betterzip \
    docker \
    flux \
    fork \
    google-chrome \
    imagealpha \
    imageoptim \
    iterm2 \
    ql-ansilove \
    qlcolorcode \
    qlmarkdown \
    qlmobi \
    qlstephen \
    quicklook-csv \
    quicklook-json \
    rectangle \
    spotify \
    sublime-text \
    syncthing \
    the-unarchiver \
    visual-studio-code

  brew tap homebrew/cask-fonts

  # Remove outdated versions from the cellar
  brew cleanup

  # Add syntax highlighting to nano
  echo 'include "/usr/local/share/nano/*.nanorc"' > ~/.nanorc
fi
