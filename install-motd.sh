#!/bin/bash
set -euo pipefail

cp files/.motd "$HOME"

login_files=(~/.bash_login ~/.zlogin)

for file in "${login_files[@]}"; do
  if [[ ! -f "$file" ]] || [[ "$(grep -c './.motd' "$file")" == 0 ]]; then
    echo "export MOTD_SERVICES=\"\"\\n./.motd" >> "$file"
  fi
done

