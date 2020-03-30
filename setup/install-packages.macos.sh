#!/bin/sh

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
    git-extras \
    gnu-sed \
    gnu-tar \
    grep \
    grepcidr \
    htop \
    iproute2mac \
    n \
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

  # Remove outdated versions from the cellar
  brew cleanup
fi
