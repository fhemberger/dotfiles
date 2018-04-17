# My dotfiles

Inspired by [Mathias Bynens](https://github.com/mathiasbynens/dotfiles/) and [Addy Osmani](https://github.com/addyosmani/dotfiles/).

- Works on macOS, Ubuntu and Arch Linux
- Installs basic binaries (`colordiff`, `curl`, `git`, `htop`, `ncdu`, `zsh`, …)
- Sets up `zsh` as default shell with
	- Autocompletions for Docker and Terraform
	- [Pure](https://github.com/sindresorhus/pure/) theme
	- Syntax highlighting

## Installation

```bash
git clone --recurse-submodules https://github.com/fhemberger/dotfiles
cd dotfiles
./install.sh
```

To safely store additional settings, add them to `~/.extra`.
