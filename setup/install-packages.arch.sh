#!/bin/sh

sudo pacman -Syu
sudo pacman -S --noconfirm \
  arch-audit \
  bat \
  colordiff \
  cronie \
  dnsutils \
  fzf \
  htop \
  nano \
  nano-syntax-highlighting \
  ncdu \
  pkgfile \
  unp \
  wget \
  zsh

# Optional dependencies for `unp`
sudo pacman -S --noconfirm --asdeps \
  unrar \
  unzip

sudo pkgfile --update

# Install yay
(
architecture="$(uname -m)"
release="$(curl --silent "https://api.github.com/repos/Jguer/yay/releases/latest" | jq -r ".assets | map(select(.name | contains (\"$architecture\"))) | .[] .browser_download_url")"
if [ -n "$release" ]; then
  filename="$(basename "$release")"
  wget -nv -O "$filename" "$release"
  unp "$filename"

  dirname="$(basename "$filename" .tar.gz)"
  sudo cp "$dirname/yay" /usr/bin/
  sudo cp "$dirname/yay.8" /usr/share/man/man8/
  sudo cp "$dirname/zsh" /usr/share/zsh/site-functions/_yay
  rm -r "$dirname"
fi
)

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
