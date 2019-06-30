#!/usr/bin/env zsh

# Make sure to have installed coreutils using `brew install coreutils`.
# Otherwise use `alias ls="ls -lAhGO"` on macOS for the same results.
alias "ls=ls -lAh --color=auto"

alias k9="kill -9"

# -- misc apps ----------------------------------------------------------------
alias s=subl
alias ncdu='ncdu --color dark'
alias whatsize=ncdu
alias pip-outdated='pip list --outdated --format=freeze'
