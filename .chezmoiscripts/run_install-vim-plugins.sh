#!/usr/bin/env bash
set -euo pipefail

command -v nvim >/dev/null 2>&1 && {(
  nvim -E -s +PlugInstall +visual +qall
)}
