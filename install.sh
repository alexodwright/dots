#!/bin/bash

packages=(
	nvim
	ghostty
	tmux
	oh-my-posh
	scripts
	zshrc
	)

if [[ ! -x $(command -v stow) ]]; then
	echo "Stow must be installed before this script can be run"
	exit 1
fi 

if [[ ! -x $(command -v git) ]]; then
	echo "Git must be installed before this script can be run"
	exit 1
fi 

if [[ ! -d ~/.config/tmux/plugins/tpm ]]; then
    git clone https://github.com/tmux-plugins/tpm $HOME/.config/tmux/plugins/tpm
fi

for app in "${packages[@]}"; do
	stow -t ~ "$app"
done

