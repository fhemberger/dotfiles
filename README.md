# My dotfiles

Complete setup for macOS, Linux (Arch and Ubuntu) and Synology NAS.

Installs useful binaries (`colordiff`, `curl`, `htop`, `ncdu`, …) and lets you chose between `fish` and `zsh` as default shell.


## Installation

Requires `git` to be installed.

```bash
git clone https://github.com/fhemberger/dotfiles
cd dotfiles
./install.sh
```

## What gets installed?

### General

- **Shell:** [fish](https://github.com/fish-shell/fish-shell) / [zsh](https://github.com/zsh-users/zsh)  

**NOTE (`zsh` only):** To safely store additional settings, add them to `~/.extra`. When adding new/updated autocompletions, it might be necessary to run `rm -f ~/.zcompdump; compinit` afterwards.

### macOS

- **Terminal emulator:** [iTerm2](https://iterm2.com/)  
- Installs GNU versions of `awk`, `find`, `grep`, `sed`, etc.

_Optionally_ [installs](./blob/master/setup/install-applications.macos.sh) a set of macOS apps (my working baseline).

### Linux (Arch)

_Optionally_ [installs](./blob/master/setup/install-applications.arch.sh):

- **Terminal emulator:** [alacritty](https://github.com/alacritty/alacritty)  
- **WM:** [i3-gaps](https://github.com/Airblader/i3)  
- **Bar:** [polybar](https://github.com/jaagr/polybar)  
- **Launcher:** [rofi](https://github.com/DaveDavenport/rofi)  
- **Notification daemon:** [dunst](https://github.com/dunst-project/dunst)  
- **File manager:** [ranger](https://github.com/ranger/ranger)  
- **Screenlocker:** [betterlockscreen](https://github.com/pavanjadhaw/betterlockscreen)  
- **Color theme generation:** [pywal](https://github.com/dylanaraps/pywal)  
- **AUR helper:** [yay](https://github.com/Jguer/yay)


### Synology NAS

Requires [`ipkg`](https://community.synology.com/enu/forum/1/post/127148) for package installation.  
Will be updated one day to use [Entware's `opkg`](https://github.com/Entware/Entware/wiki/Install-on-Synology-NAS) instead.
