#!/usr/bin/env zsh

# Files will be created with these permissions:
# files 644 -rw-r--r-- (666 minus 022)
# dirs  755 drwxr-xr-x (777 minus 022)
umask 022

function take() {
  mkdir -p $@ && cd ${@:$#}
}

# File size
alias fs="stat -f '%z bytes'"

# Copy w/ progress
cp_p () {
  rsync -WavP --human-readable --progress "$1" "$2"
}

# Create base64 URI from file
data_uri () {
  base64 "$1" | awk -v ext="${1#*.}" '{ str1=str1 $0 }END{ print "background:url(data:image/"ext";base64,"str1");" }'
}
