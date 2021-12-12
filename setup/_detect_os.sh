detect_os () {
  if [[ "$(uname)" == "Darwin" ]]; then echo "macos"; return 0; fi
  if [[ -d /.syno ]]; then echo "synology"; return 0; fi

  if [[ -f /etc/os-release ]]; then
    # shellcheck disable=SC1091
    source /etc/os-release
    # e.g. for ArchLinux ARM
    # ID=archarm
    # ID_LIKE=arch
    echo "${ID_LIKE:-ID}"
  fi
}

readonly OS="$(detect_os)"
