#!/usr/bin/env zsh

if [ $commands[gcloud] ]; then
  gcloud() {
    unfunction "$0"
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
    $0 "$@"
  }
fi

