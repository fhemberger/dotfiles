#!/usr/bin/env zsh

if [ "${commands[terraform]}" ]; then
  terraform() {
    unfunction "$0"
    source $HOME/.config/.zsh/external/_terraform
    $0 "$@"
  }
fi
