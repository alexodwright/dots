#!/usr/bin/env bash

# Set exit on error
set -e

packages=(
	nvim
	ghostty
	tmux
	oh-my-posh
	scripts
	zshrc
	)

extras=(
	rg
	tmux
	yazi
	eza
	npm
	)

# Package checks
for dep in stow curl git unzip; do
    if [[ ! -x  $(command -v "$dep") ]]; then
        echo "$dep must be installed before this script can be run"
        exit 1
    fi
done

# Install tpm
if [[ ! -d ~/.config/tmux/plugins/tpm ]]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
fi

# Install nvim
if [[ ! -x $(command -v nvim) ]]; then
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
	sudo rm -rf /opt/nvim-linux-x86_64
	sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
    rm nvim-linux-x86_64.tar.gz
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
	~/.fzf/install --all --no-update-rc
fi

# Install zed
if [[ ! -x $(command -v zed) ]]; then
	curl -f https://zed.dev/install.sh | sh
fi

# Install JetBrainsMono Nerd Font
if [[ -z $(fc-list | grep -i "JetBrainsMono") ]]; then
    echo "JetBrainsMono font not found. Installing..."
    curl -LO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
    mkdir -p "$HOME/.local/share/fonts"
    unzip JetBrainsMono.zip -d "$HOME/.local/share/fonts/JetBrainsMono"
    fc-cache -fv
    rm JetBrainsMono.zip
fi

# Install configuration files
for app in "${packages[@]}"; do
	stow -t "${HOME}" "$app"
done

echo ""  
echo "=== Checking extras ==="
missing=()  
for app in "${extras[@]}"; do
    if ! command -v "$app" &>/dev/null; then  
        missing+=("$app")
    fi
done

if [[ ${#missing[@]} -gt 0 ]]; then
    echo "The following extras still need to be installed:"
    for app in "${missing[@]}"; do
        echo "  - $app"
    done
else
    echo "All extras are installed!"
fi
