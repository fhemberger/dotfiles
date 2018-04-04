# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# shellcheck disable=SC2206
fpath=( "$HOME/.zsh/zfunctions" $fpath )

# Enable autocompletion
autoload -Uz compaudit compinit
compinit

# Enable ls colors
autoload -U colors && colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"

# Automatically quote meta-characters in URLs!
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# Ctrl-E to launch line editor
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^E' edit-command-line

# Insert the last word from the previous line.
bindkey "^P" insert-last-word

# Include dotfiles in globbing
# https://coderwall.com/p/rfwjlq
setopt globdots

# Don't share history between sessions/panes
setopt no_share_history

# If a command can’t be executed as a normal command, and the command is
# the name of a directory, perform the cd command to that directory.
setopt auto_cd

# Sourcing all the things ...
# shellcheck disable=SC1090
for file in ~/.zsh/external/oh-my-zsh/*.zsh; do [ -f "$file" ] && source "$file"; done
# shellcheck disable=SC1090
for file in ~/.zsh/init/*.sh; do [ -f "$file" ] && source "$file"; done
unset file

# shellcheck disable=SC1090
source ~/.zsh/zfunctions/syntax-highlighting
# shellcheck disable=SC1090
source ~/.zsh/zfunctions/you-should-use

# Load 'pure' prompt
autoload -U promptinit; promptinit
prompt pure

# shellcheck disable=SC1090
source ~/.extra

# brew: direnv
# eval "$(direnv hook zsh)"
