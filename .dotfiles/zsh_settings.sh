# Ctrl-E to launch line editor
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^E' edit-command-line
# Insert the last word from the previous line.
bindkey "^P" insert-last-word

# Automatically quote meta-characters in URLs!
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# Include dotfiles in globbing
setopt globdots

# Sourcing all the things ...
for file in ~/.dotfiles/.*; do [ -f "$file" ] && source "$file"; done
unset file

source ~/.extra
