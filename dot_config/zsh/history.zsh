#!/usr/bin/env zsh

# If the internal history needs to be trimmed to add the current command line, setting this
# option will cause the oldest history event that has a duplicate to be lost before losing a
# unique event from the list. You should be sure to set the value of HISTSIZE to a larger
# number than SAVEHIST in order to give you some room for the duplicated events, otherwise
# this option will behave just like HIST_IGNORE_ALL_DUPS once the history fills up with unique
# events.
setopt hist_expire_dups_first
# When searching for history entries in the line editor, do not display duplicates of a line
# previously found, even if the duplicates are not contiguous.
setopt hist_find_no_dups
# If a new command line being added to the history list duplicates an older one, the older
# command is removed from the list (even if it is not the previous event).
setopt hist_ignore_all_dups
# Do not enter command lines into the history list if they are duplicates of the previous event.
setopt hist_ignore_dups
# Remove command lines from the history list when the first character on the line is a space,
# or when one of the expanded aliases contains a leading space. Only normal aliases (not
# global or suffix aliases) have this behaviour. Note that the command lingers in the internal
# history until the next command is entered before it vanishes, allowing you to briefly reuse
# or edit the line. If you want to make it vanish right away without entering another command,
# type a space and press return.
setopt hist_ignore_space
# When writing out the history file, older commands that duplicate newer ones are omitted.
setopt hist_save_no_dups
# Show command with history expansion to user before running it
setopt hist_verify
# This option works like APPEND_HISTORY except that new history lines are added to the $HISTFILE
# incrementally (as soon as they are entered), rather than waiting until the shell exits.
setopt inc_append_history
