#!/usr/bin/env bash

if [[ "$(uname)" == "Darwin" ]]; then
  alias ls="ls -lAhGO"
else
  alias "ls=ls -lAhG --color=auto"
fi

alias k9="kill -9"

# -- misc apps ----------------------------------------------------------------
alias s=subl
alias whatsize=ncdu
alias pip-outdated='pip list --outdated --format=freeze'

