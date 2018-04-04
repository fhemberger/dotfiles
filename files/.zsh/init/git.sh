#!/usr/bin/env zsh

if [ $commands[git] ]; then
  alias g="git"

  gitclonecd() {
    git clone "$1" && cd "$(basename "$1" .git)" || return
  }
fi
