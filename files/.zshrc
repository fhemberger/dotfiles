# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

fpath=( "$HOME/.zsh/zfunctions" $fpath )

# Enable autocompletion
autoload -Uz compaudit compinit; compinit

# Enable ls colors
autoload -U colors; colors
export CLICOLOR=1
export LSCOLORS="Gxfxcxdxbxegedabagacad"

# Automatically quote meta-characters in URLs!
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# Include dotfiles in globbing
# https://coderwall.com/p/rfwjlq
setopt globdots

# Don't share history between sessions/panes
setopt no_share_history


# == Changing Directories ==
# If a command can’t be executed as a normal command, and the command is
# the name of a directory, perform the cd command to that directory.
setopt auto_cd
# don't push multiple copies of the same directory onto the directory stack
setopt pushd_ignore_dups


# == Key Bindings ==
# Ctrl-E to launch line editor
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^E' edit-command-line

# Insert the last word from the previous line.
bindkey "^P" insert-last-word


# == Sourcing all the things ... ==
for file in ~/.zsh/external/oh-my-zsh/*.zsh; do [ -f "$file" ] && source "$file"; done
for file in ~/.zsh/init/*.sh; do [ -f "$file" ] && source "$file"; done
unset file

source ~/.zsh/zfunctions/syntax-highlighting
source ~/.zsh/zfunctions/you-should-use

# == Kubernetes Prompt ==
zstyle ':zsh-kubectl-prompt:' separator '|'
_lineup=$'\e[1A'
_linedown=$'\e[1B'
source ~/.zsh/zfunctions/kubectl
RPROMPT='%{${_lineup}%}%{$fg[blue]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}%{${_linedown}%}'

# == Prompt ==
# Load 'pure' prompt
autoload -U promptinit; promptinit
prompt pure

source ~/.extra
