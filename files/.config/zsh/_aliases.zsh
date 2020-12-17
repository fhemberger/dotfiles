#!/usr/bin/env zsh

# Make sure to have installed coreutils using `brew install coreutils`.
# Otherwise use `alias ls="ls -lAhGO"` on macOS for the same results.
alias "ls=ls -lAh --color=auto --group-directories-first"

alias k9="kill -9"

# -- misc apps ----------------------------------------------------------------
if [ "${commands[subl]}" ]; then
  alias s=subl
fi
alias ncdu='ncdu --color dark'
alias pip-outdated='pip list --outdated --format=freeze'
