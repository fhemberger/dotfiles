#!/usr/bin/env zsh

if [ $commands[svn] ]; then
  # `svn diff` without whitespace
  alias svndiff="svn diff -x -uw"

  alias svn-stash="svn diff > svn_stash.patch; svn revert -R ."
  alias svn-stash-apply="patch -p0 < svn_stash.patch"
fi
