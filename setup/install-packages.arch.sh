#!/usr/bin/env bash
set -euo pipefail

sudo pacman -Syu
sudo pacman -S --noconfirm --needed \
  arch-audit \
  bat \
  colordiff \
  cronie \
  direnv \
  dnsutils \
  fd \
  fish \
  fzf \
  git-delta \
  htop \
  jq \
  nano \
  nano-syntax-highlighting \
  ncdu \
  neovim \
  nmap \
  pkgfile \
  ranger \
  rsync \
  ssh-copy-id \
  starship \
  ufw \
  unp \
  w3m \
  watch \
  wget \
  zip \
  zsh

# Optional dependencies for `unp`
sudo pacman -S --asdeps --noconfirm --needed \
  unrar \
  unzip

sudo pkgfile --update

# Install paru
(
REPO=paru-bin
if [ ! -d "$REPO" ]; then
  git clone "https://aur.archlinux.org/$REPO.git"
  cd "$REPO"
else
  cd "$REPO"
  git pull
fi
makepkg -si --noconfirm
)

paru -S nerd-fonts-meslo

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
