#!/usr/bin/env bash
set -euo pipefail

source setup/_detect_os.sh

case "$OS" in
  "arch")
    curl -Ss https://download.sublimetext.com/sublimehq-pub.gpg | sudo pacman-key --add -
    sudo pacman-key --lsign-key 8A8F901A
    echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
    sudo pacman -Syu --noconfirm sublime-text
    # TODO: Is this still necessary? Is the path correct?
    # ln -s /opt/sublime/sublime_text /usr/local/bin/subl
    ;;
  "macos")
    brew cask install sublime-text
    ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
    ;;
  "ubuntu")
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    sudo apt-get update
    sudo apt-get install -y sublime-text
    # TODO: Is this still necessary? Is the path correct?
    # ln -s /opt/sublime/sublime_text /usr/local/bin/subl
    ;;
esac
