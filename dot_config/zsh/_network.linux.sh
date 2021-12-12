#!/usr/bin/env zsh

active_interface() {
  route | awk 'NR==3 { print $8 }'
}

router_ip() {
  netstat -rn | awk 'NR==3 { print $2 }'
}

myip() {
  case $1 in
  -l|--local)
    ip -o -4 address show | awk 'NR==2 { gsub(/\/.*/, "", $4); print $4 }'
    ;;
  -a|--all)
    ip addr | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //' | sort
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
