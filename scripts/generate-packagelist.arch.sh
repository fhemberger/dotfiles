#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
pacman -Qqe | grep -v "$(pacman -Qqm)" > "$SCRIPT_DIR/Pacfile"
pacman -Qqm | grep -v "paru-bin" > "$SCRIPT_DIR/Aurfile"
