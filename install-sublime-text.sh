#!/bin/bash
set -euo pipefail

source setup/_detect_os.sh

case "$OS" in
  "arch")
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo pacman-key --add -
    sudo pacman-key --lsign-key 8A8F901A
    rm sublimehq-pub.gpg
    echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
    sudo pacman -Syu sublime-text
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
    sudo apt-get install sublime-text
    # TODO: Is this still necessary? Is the path correct?
    # ln -s /opt/sublime/sublime_text /usr/local/bin/subl
    ;;
esac
