#!/usr/bin/env zsh

if [ $commands[gittower] ]; then
  tower() {
    if [[ "$#" -gt 0 ]]; then
      gittower "$@"
    else
      gittower `git rev-parse --show-toplevel`
    fi
  }
fi

