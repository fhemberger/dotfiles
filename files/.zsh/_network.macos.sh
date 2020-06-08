#!/usr/bin/env zsh

active_interface() {
  route get example.com | grep interface | awk '{ print $2 }'
}

router_ip() {
  netstat -rn | grep -m1 'default' | awk '{ print $2 }'
}

myip() {
  case $1 in
  -l|--local)
    ipconfig getifaddr "$(active_interface)"
    ;;
  -a|--all)
    ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //' | sort
    ;;
  -h|--help)
    cat <<EOF
      Get current IP

      -l --local    Local IPv4 address
      -a --all      All interfaces
      -h --help
EOF
    ;;
  *)
    curl https://ipinfo.io/ip
    ;;
  esac
}

alias flushdns="dscacheutil -flushcache"
alias portscan="/System/Library/CoreServices/Applications/Network\ Utility.app/Contents/Resources/stroke"

