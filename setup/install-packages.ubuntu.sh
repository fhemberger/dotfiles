#!/bin/sh

sudo apt-get update
sudo apt-get install -y \
  bat \
  colordiff \
  curl \
  fzf \
  htop \
  jq \
  nano \
  ncdu \
  unp \
  zsh

# Install git diff syntax highlighter
#
# Building/installing with `yay`from scratch takes 25 minutes, so we go directly for the binary
# Can't use 'latest' because 'windows-strip-binary' being tagged as release as well
(
release="https://github.com/dandavison/delta/releases/download/0.1.1/delta-0.1.1-x86_64-unknown-linux-gnu.tar.gz"
filename="$(basename "$release")"
wget -nv -O "$filename" "$release"
unp "$filename"

dirname="$(basename "$filename" .tar.gz)"
sudo cp "$dirname/delta" /usr/bin/
rm -r "$dirname"
)

# Disable Ubuntu motd spam
# https://eklitzke.org/disabling-ubuntu-motd-spam
sudo sed -i 's/^ENABLED=.*/ENABLED=0/' /etc/default/motd-news

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
EOF
) | sudo tee -a "/etc/nanorc" > /dev/null
