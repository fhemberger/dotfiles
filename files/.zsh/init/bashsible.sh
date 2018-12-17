#!/usr/bin/env zsh

bashsible () {
  if [ "$#" -ne 2 ]; then
    echo "usage: bashsible <user@hostname> <script>"
    return 1
  fi
  if [ ! -f "$2" ]; then
    echo "Script to execute could not be found"
    return 1
  fi

  # Map all local environment variables starting with BASHSIBLE_ and inject them
  # into the command. E.g. BASHSIBLE_HOSTNAME=foo.com -> HOSTNAME=foo.com
  bashsible_env=$(env | grep "^BASHSIBLE_" | gawk '{ match($0, /BASHSIBLE_([^=]+)=(.*)/, arr); printf "%s=%s ",arr[1],arr[2] }')
  ssh $1 "${bashsible_env}bash -s" < $2
}
