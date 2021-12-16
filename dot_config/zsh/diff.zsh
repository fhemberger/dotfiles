#!/usr/bin/env zsh

# stefanjudis.com/snippets/how-to-use-gits-file-diff-outside-of-git-repositories/
function diff() {
  if [ "$#" -ne 2 ]; then
    command diff "$@"
    return
  fi

  git diff --no-index $1 $2;
}
