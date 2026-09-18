#!/usr/bin/env zsh

if [ "${commands[fzf]}" ]; then
  if [ "${commands[fd]}" ]; then
    export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  else
    export FZF_DEFAULT_COMMAND="find . -type f -not -path '*/\.git/*'"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  fi

  edit() { file=$(fzf --preview="bat --color=always {}") && [[ -n "$file" ]] && "$EDITOR" "$file"; }
fi
