#!/usr/bin/env zsh

if [ $commands[travis] ]; then
  travis() {
    unfunction "$0"
    [ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
    $0 "$@"
  }
fi

