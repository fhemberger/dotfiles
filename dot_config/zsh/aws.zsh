#!/usr/bin/env zsh

if [ "${commands[aws]}" ]; then
  aws() {
    unfunction "$0"
    source /usr/local/opt/awscli/libexec/bin/aws_zsh_completer.sh
    $0 "$@"
  }
fi

