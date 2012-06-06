# SVN prompt
function svn_prompt_info() {
	if [ -d .svn ]; then echo "$ZSH_THEME_SVN_PROMPT_PREFIX$ZSH_THEME_SVN_PROMPT_SUFFIX"; fi
}

ZSH_THEME_SVN_PROMPT_PREFIX="%{$reset_color%}[%{$fg[magenta]%}svn"
ZSH_THEME_SVN_PROMPT_SUFFIX="%{$reset_color%}]"

# GIT prompt
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}[%{$fg[magenta]%}git:%U"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}+"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[magenta]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[yellow]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%}?"

local user=""
local pwd="%{$fg[cyan]%}%c"

PROMPT="%{$fg_bold[red]%}➜ ${user} ${pwd} %{$reset_color%}"
RPROMPT="$(git_prompt_status) $(git_prompt_info)$(svn_prompt_info)%{$fg_bold[blue]%}%{$reset_color%}"
