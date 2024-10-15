# My dotfiles

Complete setup for macOS, Arch Linux, Debian/Ubuntu, Android (Termux) and Synology NAS.

Installs useful binaries (`bat`, `colordiff`, `curl`, `fzf`, `git-delta`, `htop`, `gdu`, …), the [Starship](https://starship.rs) prompt and `zsh` as default shell.


## Installation

Prerequisites:
- `curl`
- `git`
- [`chezmoi`](https://www.chezmoi.io/), [Download](https://github.com/twpayne/chezmoi/releases)

```bash
# Create config directory
mkdir -p ~/.config/chezmoi/

# Download and render config file template
curl -sS https://raw.githubusercontent.com/fhemberger/dotfiles/main/.chezmoi.yaml.tmpl \
  | chezmoi execute-template -o ~/.config/chezmoi/chezmoi.yaml

# Edit ~/.config/chezmoi/chezmoi.yaml, then
chezmoi init --apply https://github.com/fhemberger/dotfiles.git
```


## What gets installed?

### General

- **Shell:** [zsh](https://github.com/zsh-users/zsh)  
- **Archive management:** `unp`, `unrar`, `unzip`, `zip`
- **Tools:**  `bat`, `colordiff`, `curl`, `direnv`, `dnsutils`, `fd`, `fzf`, `git-delta`, `htop`, `jq`, `nano`, `gdu`, `(neo)vim`, `nmap`, `ranger`, `rsync`, `tmux`, `ufw`, 
`wget`

### macOS

- **Terminal emulator:** [iTerm2](https://iterm2.com/)
- Installs [Homebrew](https://brew.sh/)
- Installs GNU versions of `awk`, `find`, `grep`, `sed`, etc.
- Installs my [macOS baseline apps](blob/main/packages/Brewfile)

### Arch Linux

- **AUR helper:** [paru](https://github.com/Morganamilo/paru)
- **Pacman hooks:** [arch-audit](https://github.com/ilpianista/arch-audit), [overdue](https://github.com/tylerjl/overdue), [pacman-cleanup-hook](https://aur.archlinux.org/packages/pacman-cleanup-hook)

### Synology NAS

Requires [Entware's `opkg`](https://github.com/Entware/Entware/wiki/Install-on-Synology-NAS) package manager. It can be installed using the [Easy Bootstrap Installer](https://www.cphub.net/?p=ebi) package.
