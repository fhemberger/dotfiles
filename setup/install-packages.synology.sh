#!/bin/sh

if [ "$(echo "$PATH" | grep "/opt" -c)" -eq 0 ]; then
  export PATH="/opt/bin:/opt/sbin:$PATH"
fi

ipkg update
ipkg install \
  diffutils \
  gettext \
  less \
  ncdu \
  openssl \
  procps \
  python3 \
  wget-ssl \
  zsh
