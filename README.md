# Dotfiles

This repository manages the dotfiles for any Unix-based system

## Requirements

The requirements are handled inside `./install.sh`, but incase, requirements include:

- `git`
- `stow`

These should be installed via the system's package manager.

Following the installation of the requirements, clone the git repository anywhere on the system

`$ git clone https://github.com/alexodwright/dots`

Then change directory into the cloned repository

`$ cd dots`

Then run the installation script

`$ ./install.sh`

By default, the installation script will only install the following dotfiles, as they are always desired:

- `nvim`
- `ghostty`
- `tmux`
- `oh-my-posh`
- `scripts`
- `zshrc`
- `tmux`

These packages are also recommended for installation, to ensure proper workings across the system:

- `ripgrep`
- `yazi`
- `eza`
- `npm`

The following software is also installed, if not already. These are platform agnostic, and do not require usage of the package manager:

- `nvim`
- `zed`
- `fzf`
- `zoxide`
- `oh-my-posh`
