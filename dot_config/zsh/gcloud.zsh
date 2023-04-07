#!/usr/bin/env zsh

if [ "${commands[gcloud]}" ]; then
  gcloud() {
    unfunction "$0"

    if [[ "$(uname)" == "Darwin" ]]; then
      source "$HOMEBREW_PREFIX/share/google-cloud-sdk/path.zsh.inc"
      source "$HOMEBREW_PREFIX/share/google-cloud-sdk/completion.zsh.inc"
    fi
    $0 "$@"
  }
fi
