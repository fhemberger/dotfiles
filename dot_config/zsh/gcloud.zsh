#!/usr/bin/env zsh

if [ "${commands[gcloud]}" ]; then
  gcloud() {
    unfunction "$0"

    if [[ "$(uname)" == "Darwin" ]]; then
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
    fi
    $0 "$@"
  }
fi

