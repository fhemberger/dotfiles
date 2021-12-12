if type -q "fd"
  set -q FZF_DEFAULT_COMMAND "fd --type f --hidden --follow --exclude .git"
  set -q FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
else
  set -q FZF_DEFAULT_COMMAND "find . -type f -not -path '*/\.git/*'"
  set -q FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
end
