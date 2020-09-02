# You may need to manually set your language environment
export LANG=en_US.UTF-8
export ZSH_CACHE_DIR="$HOME/.config/.zsh/cache"

# Preferred editor for local and remote sessions
if [ -n "$SSH_CONNECTION" ]; then
  export EDITOR='nano'
  export GIT_EDITOR='nano'
elif [ "${commands[subl]}" ]; then
  export EDITOR='subl -w'
  export GIT_EDITOR='subl -w'
fi

fpath=( "$HOME/.config/.zsh/zfunctions" $fpath )

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
for file in ~/.config/.zsh/*.zsh; do source "$file"; done; unset file
source ~/.config/.zsh/zfunctions/syntax-highlighting


# == Prompt ==
autoload -U promptinit; promptinit

# Set Spaceship ZSH as a prompt
SPACESHIP_DOCKER_VERBOSE=false
SPACESHIP_CHAR_SYMBOL="❯ "
SPACESHIP_DOCKER_PREFIX=""
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  # hg            # Mercurial section (hg_branch  + hg_status)
  # package       # Package version
  # node          # Node.js section
  # ruby          # Ruby section
  # elixir        # Elixir section
  # xcode         # Xcode section
  # swift         # Swift section
  # golang        # Go section
  # php           # PHP section
  # rust          # Rust section
  # haskell       # Haskell Stack section
  # julia         # Julia section
  docker        # Docker section
  # aws           # Amazon Web Services section
  # venv          # virtualenv section
  # conda         # conda virtualenv section
  # pyenv         # Pyenv section
  # dotnet        # .NET section
  # ember         # Ember.js section
  kubectl        # Kubectl context section
  # terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  # battery       # Battery level and status
  # vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
prompt spaceship


source ~/.extra
