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
git submodule update --init --recursive
./install.sh
```

To safely store additional settings, add them to `~/.extra`.

**NOTE:** When adding new/updated autocompletions, it might be necessary to run `rm -f ~/.zcompdump; compinit` afterwards.
