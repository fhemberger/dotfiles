#!/usr/bin/env bash
set -euo pipefail

shellcheck ./*.sh -x setup/*.sh
