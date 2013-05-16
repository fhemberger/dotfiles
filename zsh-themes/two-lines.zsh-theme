# SVN prompt
function svn_prompt_info() {
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

PROMPT="
$fg[cyan]%m: $fg[yellow]${working_dir}
%{$fg_bold[red]%}➜ %{$reset_color%} "
RPROMPT="${git_status}${svn_status}%{$reset_color%}"
