add_to_path() {
    for path in $@; do
        echo $PATH | grep -q -s "$path"
        if [ $? -eq 1 ]; then PATH=$path:$PATH; fi
    done
    export PATH
}

# Terminal colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Sourcing all the things ...
for file in ~/.dotfiles/.*; do [ -r "$file" ] && source "$file"; done
unset file