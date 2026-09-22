#!/usr/bin/env zsh

if [ "${commands[docker]}" ]; then
  # https://forums.docker.com/t/silence-the-scout-message-after-docker-build/136672
  export DOCKER_CLI_HINTS=false

  alias dpsa='docker ps -a --format "table {{.Names}}\t{{.Image}}\t{{.Status}}" | sed 1d | sort'

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
