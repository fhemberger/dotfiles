#!/usr/bin/env zsh

if [ $commands[npm] ]; then
  npm() {
    unfunction "$0"
    eval "$(npm completion 2>/dev/null)"
    $0 "$@"
  }

  alias nom="npm"

  # List npm packages without dependencies
  npm-list() {
    npm ls "$@" --depth=0 -s | grep "^├" | cut -c5-
  }

  # Open the package on npm
  npm-info() {
    open "https://www.npmjs.com/package/$1"
  }
fi
