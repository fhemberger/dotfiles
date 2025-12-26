#!/usr/bin/env zsh

if [ "${commands[git]}" ]; then
  alias g="git"

  git-clone-cd() {
    local base="$(basename "$1" .git)"
    git clone $@ && cd "${2:-$base}" || return
  }

  git-delete-merged-branches() {
    current_branch="$(git branch --show-current)"
    git checkout --quiet "$(git remote show origin | sed -n '/HEAD branch/s/.*: //p')"
    git branch --merged | grep -Ev '(^\*|^\+|master|main)' | xargs -n 1 git branch --delete
    git checkout --quiet "$current_branch"
  }

  alias gccd=git-clone-cd
fi
