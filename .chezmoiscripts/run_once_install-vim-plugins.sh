#!/usr/bin/env bash
set -euo pipefail

if command -v nvim >/dev/null 2>&1; then
  nvim -E -s +PlugInstall +visual +qall
fi
