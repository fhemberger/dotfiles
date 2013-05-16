# Settings for bash
vcs_info() {
    if [ -d .svn ]; then
        echo -e " \033[0m[\033[0;35msvn\033[0m]"
    else
        branch=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
        if [ $branch ]; then
            # If branch is not master, add branch name
            branch=`echo $branch | sed -e 's/master//'`
            if [ $branch ]; then branch="\033[0m:\033[4;35m$branch"; fi
            echo -e " \033[0m[\033[0;35mgit$branch\033[0m]"
        fi
    fi
}

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

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
# list of commands that should not be added to history
export HISTIGNORE="ls:ls *:exit"

# Command line
PS1='[\e[0;32m\u\e[0m@\e[0;36m\h\e[0m] \e[0;34m\w\e[0m$(vcs_info)\$ '

# Sourcing all the things ...
for file in ~/.dotfiles/.*; do [ -f "$file" ] && source "$file"; done
unset file

source ~/.extra
