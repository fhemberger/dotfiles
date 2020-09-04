#!/usr/bin/env bash
set -euo pipefail

sudo pacman -Syu
sudo pacman -S --noconfirm \
  arch-audit \
  bat \
  colordiff \
  cronie \
  direnv \
  dnsutils \
  fish \
  fzf \
  htop \
  jq \
  nano \
  nano-syntax-highlighting \
  ncdu \
  nmap \
  pkgfile \
  ranger \
  rsync \
  ssh-copy-id \
  unp \
  w3m \
  watch \
  wget \
  zip \
  zsh

# Optional dependencies for `unp`
sudo pacman -S --noconfirm --asdeps \
  unrar \
  unzip

sudo pkgfile --update

# Install yay
(
REPO=yay-bin
if [ ! -d "$REPO" ]; then
  git clone "https://aur.archlinux.org/$REPO.git"
  cd "$REPO"
else
  cd "$REPO"
  git pull
fi
makepkg -si --noconfirm
)

# Install git diff syntax highlighter
yay -S --answerdiff=None --noconfirm git-delta-bin

# Install arch-audit pacman hook, scans installed packages for known vulnerabilities:
# https://wiki.archlinux.org/index.php/Pacman#Hooks
sudo ln -sf /usr/share/arch-audit/arch-audit.hook /usr/share/libalpm/hooks/arch-audit.hook

# Disable sudo password for current user
(
cat <<-EOF
# User rules for $USER
$USER ALL=(ALL) NOPASSWD:ALL
EOF
) | sudo tee "/etc/sudoers.d/$USER" > /dev/null

# Add syntax highlighting to nano
(
cat <<-EOF
include "/usr/share/nano/*.nanorc"
include "/usr/share/nano-syntax-highlighting/*.nanorc"
EOF
) | sudo tee -a "/etc/nanorc" > /dev/null
