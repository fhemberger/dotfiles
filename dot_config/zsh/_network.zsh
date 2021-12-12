#!/usr/bin/env zsh

case $OSTYPE in
linux*)
  source ~/.config/zsh/_network.linux.sh
  ;;
darwin*)
  source ~/.config/zsh/_network.macos.sh
  ;;
esac

# List of HTTP status codes
httpcodes() {
  node -p 'require("http").STATUS_CODES' | sed -E "s/[{},'\]//g;s/^[ ]+//g"
}

# Start an HTTP server from a directory, optionally specifying the port
server() {
  local port="${1:-8000}"
  python3 -m http.server "$port" 2> /dev/null
}

# Scan local network for devices
# Ping broadcast first
scanlocal() {
  ping -c 1 "$(router_ip | cut -d . -f 1-3)".255 > /dev/null && arp -ai "$(active_interface)" | sed 's/(//g;s/)//g' | awk '{ printf "%-16s %-20s %-5s %-14s %s\n", $2, $4, $6, $8, $1}'
}

# Test internet download speed
alias speedtest="wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip"

NETWORK_RANGE=$(ip -4 addr show en0 | grep inet | awk '{ print $2 }')

function scan-ips {
  sudo nmap -sn -oG - "$NETWORK_RANGE" | awk '/Status: Up$/{ gsub(/[()]/,"",$3); print $2,"\011",tolower($3) }' | sort
}

function scan-ports {
  sudo nmap --open "$NETWORK_RANGE" | grep -vE '^(Starting Nmap|Host is |Not shown:|Some closed ports may be reported as filtered)'
}
