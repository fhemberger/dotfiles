#!/usr/bin/env bash
set -euo pipefail

DEFAULT_NETWORK_INTERFACE=$(ip route | grep '^default' | awk '{print $5}' | head -n1)

# Terminate already running bar instances
killall -q polybar || true

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Set colors according to those defined by wal
source "${HOME}/.cache/wal/colors.sh"
# background=$color0
# background_alt=$color3
# foreground=$color15
# foreground_alt=$color2
# highlight=$color4

# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

echo "---" >> /tmp/polybar-example.log
polybar example >> /tmp/polybar-example.log 2>&1 &
