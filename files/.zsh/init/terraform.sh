#!/usr/bin/env zsh

if [ $commands[terraform] ]; then
  terraform() {
    unfunction "$0"
    source ../external/_terraform
    $0 "$@"
  }
fi
