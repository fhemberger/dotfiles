#!/usr/bin/env zsh

case $(uname) in
Linux)
  source ~/.zsh/init/_network.linux.sh
  ;;
Darwin)
  source ~/.zsh/init/_network.macos.sh
  ;;
esac

# List of HTTP status codes
httpcodes() {
  node -p 'require("http").STATUS_CODES' | sed -E "s/[{},'\]//g;s/^[ ]+//g"
}

# Start an HTTP server from a directory, optionally specifying the port
server() {
  local port="${1:-8000}"
  # Uncomment to open new tab in browser. This really nagged me when restarting the server.
  # open "http://localhost:${port}/"
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  /usr/bin/python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port" 2> /dev/null
}

# Scan local network for devices
# Ping broadcast first
scanlocal() {
  ping -c 1 "$(router_ip | cut -d . -f 1-3)".255 > /dev/null && arp -ai "$(active_interface)" | sed 's/(//g;s/)//g' | awk '{ printf "%-16s %-20s %-5s %-14s %s\n", $2, $4, $6, $8, $1}'
}

# Test internet download speed
alias speedtest="wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip"
