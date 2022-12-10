# My dotfiles

Complete setup for macOS, Arch Linux, Ubuntu and Synology NAS.

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
- **Archive management:** `unp`, `unrar`, `unzip`, `zip`
- **Tools:**  `bat`, `colordiff`, `curl`, `direnv`, `dnsutils`, `fd`, `fzf`, `git-delta`, `htop`, `jq`, `nano`, `ncdu`, `(neo)vim`, `nmap`, `ranger`, `rsync`, `tmux`, `ufw`, 
`wget`

### macOS

- **Terminal emulator:** [iTerm2](https://iterm2.com/)
- Installs [Homebrew](https://brew.sh/)
- Installs GNU versions of `awk`, `find`, `grep`, `sed`, etc.
- Installs my [macOS baseline apps](blob/main/packages/Brewfile)

### Arch Linux

- **AUR helper:** [paru](https://github.com/Morganamilo/paru)
- **Pacman hooks:** [arch-audit](https://github.com/ilpianista/arch-audit), [overdue](https://github.com/tylerjl/overdue), [pacman-cleanup-hook](https://aur.archlinux.org/packages/pacman-cleanup-hook)

When **not** installed over an SSH connection:

- **Terminal emulator:** [alacritty](https://github.com/alacritty/alacritty)  
- **WM:** [i3-gaps](https://github.com/Airblader/i3)  
- **Bar:** [polybar](https://github.com/jaagr/polybar)  
- **Launcher:** [rofi](https://github.com/DaveDavenport/rofi)  
- **Notification daemon:** [dunst](https://github.com/dunst-project/dunst)  
- **File manager:** [ranger](https://github.com/ranger/ranger)  
- **Screenlocker:** [betterlockscreen](https://github.com/pavanjadhaw/betterlockscreen)  
- **Color theme generation:** [pywal](https://github.com/dylanaraps/pywal)  

### Ubuntu

- **Clipboard manager:** [gpaste](https://github.com/Keruspe/GPaste)
- **Launcher:** [Ulauncher](https://ulauncher.io/)

### Synology NAS

Requires [Entware's `opkg`](https://github.com/Entware/Entware/wiki/Install-on-Synology-NAS) package manager. It can be installed using the [Easy Bootstrap Installer](https://www.cphub.net/?p=ebi) package.
