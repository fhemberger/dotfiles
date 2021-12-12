# Start an HTTP server from a directory, optionally specifying the port
function server
  set -q argv[1]
  or set argv 8000
  python3 -m http.server "$argv[1]" 2> /dev/null
end
