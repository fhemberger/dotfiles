#!/usr/bin/env zsh

if [ $commands[docker] ]; then
  docker() {
    unfunction "$0"
    source $HOME/.zsh/external/_docker
    $0 "$@"
  }

  docker-compose() {
    unfunction "$0"
    source $HOME/.zsh/external/_docker-compose
    $0 "$@"
  }

  docker-machine() {
    unfunction "$0"
    source $HOME/.zsh/external/_docker-machine
    $0 "$@"
  }

  alias dco='docker-compose'
  alias dcup='docker-compose up'
  alias dcdn='docker-compose down'

  docker-remove-containers() {
    docker rm -f "$(docker ps -a -q)"
  }

  docker-remove-images() {
    docker rmi -f "$(docker images -q)"
  }
fi
