#!/usr/bin/env zsh

# Make sure to have installed coreutils using `brew install coreutils`.
# Otherwise use `alias ls="ls -lAhGO"` on macOS for the same results.
alias "ls=ls -lAh --color=auto --group-directories-first"

alias k9="kill -9"

# -- misc apps ----------------------------------------------------------------
if [ "${commands[subl]}" ]; then
  alias s=subl
fi

if [ "${commands[yt-dlp]}" ]; then
  alias youtube-dl=yt-dlp
  alias youtube-dl-audio='yt-dlp -f "bestaudio[ext=m4a]/bestaudio[ext=mp3]" --ignore-errors --output "~/Downloads/%(title)s.%(ext)s"'
fi

if [ "${commands[pip]}" ]; then
  alias pip-outdated='pip list --outdated --format=freeze'
fi

if [ "${commands[ncdu]}" ]; then
  if [ "$(uname)" = "Darwin" ]; then
    alias ncdu='ncdu -xe --exclude-firmlinks --color dark'
  else
    alias ncdu='ncdu -xe --color dark'
  fi
fi

if [ "${commands[chezmoi]}" ]; then
  alias cm=chezmoi
fi

if [ "${commands[nvim]}" ]; then
  alias vim=nvim
fi
