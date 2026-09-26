#!/usr/bin/env zsh

if [ "${commands[git]}" ]; then
  alias g="git"
  alias gccd=git-clone-cd
fi
