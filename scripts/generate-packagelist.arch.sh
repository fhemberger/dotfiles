#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
pacman -Qqe | grep -v "$(cat "$SCRIPT_DIR/../packages/Pacfile.x11")" | grep -v "$(pacman -Qqm)" > "$SCRIPT_DIR/Pacfile"
pacman -Qqm | grep -v "$(cat "$SCRIPT_DIR/../packages/Aurfile.x11")" grep -v "paru-bin" > "$SCRIPT_DIR/Aurfile"
