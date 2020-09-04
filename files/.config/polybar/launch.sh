#!/usr/bin/env bash
set -euo pipefail

# Terminate already running bar instances
killall -q polybar || true

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

echo "---" >> /tmp/polybar-example.log
polybar example >> /tmp/polybar-example.log 2>&1
