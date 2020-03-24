# My dotfiles

Inspired by [Mathias Bynens](https://github.com/mathiasbynens/dotfiles/) and [Addy Osmani](https://github.com/addyosmani/dotfiles/).

- Works on macOS, Ubuntu and Arch Linux
- Installs GNU versions of `awk`, `find`, `grep`, `sed`, etc. on macOS
- Installs useful binaries (`colordiff`, `curl`, `htop`, `ncdu`, `zsh`, …)
- Sets up `zsh` as default shell with
	- Autocompletions for Docker and Terraform
	- [Spaceship](https://github.com/denysdovhan/spaceship-prompt) prompt
	- Syntax highlighting

## Installation

Requires `git` (and [Homebrew](https://brew.sh/) on macOS) to be installed.

```bash
git clone --depth=1 --recurse-submodules https://github.com/fhemberger/dotfiles
cd dotfiles
./install.sh
```

To safely store additional settings, add them to `~/.extra`.

**NOTE:** When adding new/updated autocompletions, it might be necessary to run `rm -f ~/.zcompdump; compinit` afterwards.
