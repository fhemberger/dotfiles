#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
brew bundle dump --formula --cask --tap --mas --force --file="$SCRIPT_DIR/../packages/Brewfile"
