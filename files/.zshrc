# You may need to manually set your language environment
export LANG=en_US.UTF-8
export ZSH_CACHE_DIR="$HOME/.config/zsh/cache"

# Preferred editor for local and remote sessions
if [ -n "$SSH_CONNECTION" ]; then
  export EDITOR='nano'
  export GIT_EDITOR='nano'
elif [ "${commands[subl]}" ]; then
  export EDITOR='subl -w'
  export GIT_EDITOR='subl -w'
fi

fpath=( "$HOME/.config/zsh/zfunctions" $fpath )

# Enable autocompletion
autoload -Uz compinit
() {
  if [[ $# -gt 0 ]]; then
    compinit
  else
    compinit -C
  fi
} ${ZDOTDIR:-$HOME}/.zcompdump(N.mh+24)

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
# setopt no_share_history


# == Changing Directories ==
# If a command can’t be executed as a normal command, and the command is
# the name of a directory, perform the cd command to that directory.
setopt auto_cd
# don't push multiple copies of the same directory onto the directory stack
setopt pushd_ignore_dups


# == Sourcing all the things ... ==
for file in ~/.config/zsh/*.zsh; do source "$file"; done; unset file
source ~/.config/zsh/zfunctions/syntax-highlighting


# == Prompt ==
autoload -U promptinit; promptinit
eval "$(starship init zsh)"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] && (! echo "$PATH" | grep -q "$HOME/.local/bin"); then
  export PATH="$HOME/.local/bin:$PATH"
fi

source ~/.extra
