# Threshold (sec) for showing cmd exec time
CMD_MAX_EXEC_TIME=5

# SVN prompt
svn_prompt_info() {
  if [ -d .svn ]; then echo "$ZSH_THEME_SVN_PROMPT_PREFIX$ZSH_THEME_SVN_PROMPT_SUFFIX"; fi
}

ZSH_THEME_SVN_PROMPT_PREFIX="%{$reset_color%}[%{$fg[magenta]%}svn"
ZSH_THEME_SVN_PROMPT_SUFFIX="%{$reset_color%}]"

# GIT prompt
# Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}[%{$fg[magenta]%}git:%U"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔ "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}✗ "

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}+"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[magenta]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[yellow]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%}?"

local working_dir='${PWD/#$HOME/~}'
local git_status='$(git_prompt_status) $(git_custom_status)'
local svn_status='$(svn_prompt_info)'

# Displays the exec time of the last command if set threshold was exceeded
cmd_exec_time() {
  local stop=`date +%s`
  local start=${cmd_timestamp:-$stop}
  let local elapsed=$stop-$start
  [ $elapsed -gt $CMD_MAX_EXEC_TIME ] && echo ${elapsed}s
}

ssh_connection() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "$fg[cyan]%n@%m: "
  fi
}

preexec() {
  cmd_timestamp=`date +%s`
}

precmd() {
  print -P '\n$(ssh_connection)$fg[yellow]${PWD/#$HOME/~}%F{blue} `cmd_exec_time`%f'
  # Reset value since `preexec` isn't always triggered
  unset cmd_timestamp
}

PROMPT="%(?.%F{blue}.%F{red})❯%f "
RPROMPT="${git_status}${svn_status}%{$reset_color%}"
