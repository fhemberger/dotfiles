#!/usr/bin/env zsh

if [ "${commands[git]}" ]; then
  alias g="git"

  gitclonecd() {
    local base="$(basename "$1" .git)"
    git clone $@ && cd "${2:-base}" || return
  }

  alias gccd=gitclonecd
fi
