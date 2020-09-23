#!/usr/bin/env bash
set -euo pipefail

echo "Updating Git modules ..."
git submodule update --init --recursive --remote --depth=1

source setup/_detect_os.sh

# Synology: Make sure ipkg is in PATH
if [ "$OS" == "synology" ] && [ "$(echo "$PATH" | grep "/opt" -c)" -eq 0 ]; then
  export PATH="/opt/bin:/opt/sbin:$PATH"
fi

# Install base packages
[ -f "setup/install-packages.$OS.sh" ] && "setup/install-packages.$OS.sh"

# Install desktop applications (optional)
if [ -z "${INSTALL_APPLICATIONS:-}" ] && [ -f "setup/install-applications.$OS.sh" ]; then
  echo -e "\nInstall desktop applications (and X11, etc. on Linux)? "
  select INSTALL_APPLICATIONS in yes no; do
    break
  done

  [ "$INSTALL_APPLICATIONS" == "yes" ] && "setup/install-applications.$OS.sh"
fi

# Copy dotfiles
setup/dotfiles.sh

# Configure shell
if [ -z "${CONFIGURE_SHELL:-}" ]; then
  echo -e "\nSelect shell to configure: "
  select CONFIGURE_SHELL in zsh fish; do
    break
  done
fi

setup/${CONFIGURE_SHELL}.sh

if [ "$(basename "${SHELL:-}")" != "$CONFIGURE_SHELL" ]; then
  if command -v chsh >/dev/null 2>&1; then
    chsh "$USER" -s "$(command -v "$CONFIGURE_SHELL")";
  else
    echo >&2 "'chsh' command not found, please change your login shell manually in '/etc/passwd'."
  fi

  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    echo -e "\nRun the following command to exit your current SSH session and load the new shell on login:\n"
    echo "ps -ef | grep sshd | grep \`whoami\` | awk '{print "kill -9", \$2}' | sh"
    echo -e "\n"
  fi
fi
