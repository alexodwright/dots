# environment variables
export EDITOR='nvim'
# tokyo night fzf theme
export FZF_DEFAULT_OPTS="--color=fg:#c0caf5,bg:#1a1b26,hl:#bb9af7 --color=fg+:#c0caf5,bg+:#1a1b26,hl+:#7dcfff --color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff --color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a"

# make omp and zoxide work
export PATH=$PATH:/home/$(whoami)/.local/bin

# aliases
if [[ -x "$(command -v eza)" ]]; then
    alias ls='eza -1 --icons=auto' # short list
    alias lt='eza --icons=auto --tree' # list folder as tree
fi
if [[ -x "$(command -v thunar)" ]]; then
    alias explorer='thunar() { command thunar "$@" & }; thunar'
fi
alias mz='function _mz() { mkdir -p "$1" && z "$1"; }; _mz' # make dir and z to it
alias py='python'
alias mkdir='mkdir -p'
alias srczsh='source ~/.zshrc'
alias open='xdg-open'
alias code='zed'

# func
function _ta() {
	tmux new-session -As $1
}
alias ta="_ta"

function _gitAddCommitPush() {
	if [ $# -ne 3 ]; then
	    echo "Usage: $0 <commit message> <remote> <branch>"
	    exit 1
	fi
	message=$1
	remote=$2
	branch=$3

	git add . && git commit -m "$message" && git push $remote $branch
}

alias gacp="_gitAddCommitPush"

# bluetooth nonsense
airpods='18:3F:70:D6:0F:20'
speaker='10:28:74:99:BC:21'
headphones='80:99:E7:FE:79:AB'

function bluetooth_disconnect()
{
    if [ -z "${(P)1}" ]; then
        echo "Device doesn't exist"
    else
        bluetoothctl disconnect "${(P)1}";
    fi
}

function bluetooth_connect()
{
    if [ -z "${(P)1}" ]; then
        echo "Device doesn't exist"
    else
        bluetoothctl connect "${(P)1}";
    fi

}

alias bd="bluetooth_disconnect"
alias bc="bluetooth_connect"

# git aliases
# git log (verbose) graphed with parents and all branches
alias glv="git log --oneline --graph --all --parents"

# configure the shell to use oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/zen.omp.toml)"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

# source and load zinit
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
autoload -Uz compinit
compinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# zinit plugins
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light mattmc3/ez-compinit

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


eval "$(zoxide init zsh)"
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# bindings
bindkey '^P' up-line-or-history
bindkey '^N' down-line-or-history
bindkey '^F' autosuggest-accept
bindkey "^[[3~" delete-char
bindkey "^[[3;3~" delete-word
bindkey "^[[1;3D" vi-backward-word
bindkey "^[[1;3C" vi-forward-word

# bun completions
[ -s "/home/alex/.bun/_bun" ] && source "/home/alex/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# == yazi configuration ==
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
alias bat="batcat"
alias py="python3"
bindkey -s '^o' 'sessionizer
'
export PATH="$HOME/.npm-global/bin:$PATH"
