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

  ssh $1 'bash -s' < $2
}
