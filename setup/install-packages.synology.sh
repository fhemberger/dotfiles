#!/bin/sh

if [ "$(echo "$PATH" | grep "/opt" -c)" -eq 0 ]; then
  export PATH="/opt/bin:/opt/sbin:$PATH"
fi

opkg update
opkg install \
  diffutils \
  less \
  ncdu \
  python3 \
  python3-pip \
  wget \
  zsh
