#!/bin/bash

set -euo pipefail
if [[ "$(whoami)" != "root" ]]; then
  sudo -v

  # Set rights so we donʼt need to use sudo for npm or homebrew
  sudo mkdir -p /usr/local
  sudo chown -R "$USER" /usr/local
fi

# Detect current OS
# Comma separated key(= check to evaluate)/value list
detected_os=""
for i in "$(uname) == Darwin",mac_os '-f /etc/manjaro-release',arch '-f /etc/centos-release',centos '-f /etc/os-release',ubuntu '-d /.syno',synology; do
  os_test=${i%,*};
  os=${i#*,};
  eval "if [[ $os_test ]]; then detected_os=$os; break; fi"
done

[ $detected_os ] && setup/install-packages.$detected_os.sh

setup/dotfiles.sh
setup/zsh.sh
chsh -s "$(which zsh)"
