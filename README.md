# My dotfiles

Complete setup for macOS, Linux (Arch and Ubuntu) and Synology NAS.

Installs useful binaries (`bat`, `colordiff`, `curl`, `fzf`, `git-delta`, `htop`, `ncdu`, …), the [Starship](https://starship.rs) prompt and `zsh` as default shell.

Also includes my [AutoHotkey](https://autohotkey.com) keyboard mappings for Windows (not installed automatically).


## Installation

Prerequisites:
- `git`
- [`chezmoi`](https://www.chezmoi.io/)

```bash
# Download config file template
curl -o ~/.config/chezmoi/chezmoi.yaml --create-dirs \
     https://raw.githubusercontent.com/fhemberger/dotfiles/main/.chezmoi.yaml

# Edit ~/.config/chezmoi/chezmoi.yaml, then
chezmoi init --apply https://github.com/fhemberger/dotfiles.git
```


## What gets installed?

### General

- **Shell:** [zsh](https://github.com/zsh-users/zsh)  

### macOS

- **Terminal emulator:** [iTerm2](https://iterm2.com/)  
- Installs GNU versions of `awk`, `find`, `grep`, `sed`, etc.
- Installs a my [macOS baseline apps](blob/main/setup/install-applications.macos.sh)

### Linux (Arch)

- **AUR helper:** [paru](https://github.com/Morganamilo/paru)

When **not** installed over an SSH connection:

- **Terminal emulator:** [alacritty](https://github.com/alacritty/alacritty)  
- **WM:** [i3-gaps](https://github.com/Airblader/i3)  
- **Bar:** [polybar](https://github.com/jaagr/polybar)  
- **Launcher:** [rofi](https://github.com/DaveDavenport/rofi)  
- **Notification daemon:** [dunst](https://github.com/dunst-project/dunst)  
- **File manager:** [ranger](https://github.com/ranger/ranger)  
- **Screenlocker:** [betterlockscreen](https://github.com/pavanjadhaw/betterlockscreen)  
- **Color theme generation:** [pywal](https://github.com/dylanaraps/pywal)  

### Synology NAS

Requires [Entware's `opkg`](https://github.com/Entware/Entware/wiki/Install-on-Synology-NAS) package manager. It can be installed using the [Easy Bootstrap Installer](https://www.cphub.net/?p=ebi) package.
