#!/bin/bash

packages=(
	nvim
	ghostty
	tmux
	oh-my-posh
	scripts
	zshrc
	)

extras=(
	ripgrep
	tmux
	yazi
	eza
	)

# Package checks
if [[ ! -x $(command -v stow) ]]; then
	echo "Stow must be installed before this script can be run"
	exit 1
fi 

if [[ ! -x $(command -v git) ]]; then
	echo "Git must be installed before this script can be run"
	exit 1
fi 

# Install tpm
if [[ ! -d ~/.config/tmux/plugins/tpm ]]; then
    git clone https://github.com/tmux-plugins/tpm $HOME/.config/tmux/plugins/tpm
fi

# Install nvim
if [[ ! -x $(command -v nvim) ]]; then
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
	sudo rm -rf /opt/nvim-linux-x86_64
	sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
fi

# Install oh-my-posh
if [[ ! -x $(command -v oh-my-posh) ]]; then
	curl -s https://ohmyposh.dev/install.sh | bash -s
fi

# Install zoxide
if [[ ! -x $(command -v zoxide) ]]; then
	curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
fi

# Install fzf
if [[ ! -x $(command -v fzf) ]]; then
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
fi

# Install zed
if [[ ! -x $(command -v zed) ]]; then
	curl -f https://zed.dev/install.sh | sh
fi

# Install configuration files
for app in "${packages[@]}"; do
	stow -t ~ "$app"
done

# Finally check for missing packages
for app in "${extras[@]}"; do
	if ! command -v ${app}; then
		echo "Still have to install $app"
	fi
done
