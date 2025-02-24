#  Error if variable undefined, print each command
# set -euf -o pipefile

sudo apt update -y
sudo apt upgrade -y

sudo apt install cmake pkg-config libssl-dev libglib2.0-dev gcc-multilib -y

# # Headless Chrome Dependencies
# sudo apt install -y libappindicator1 fonts-liberation
# sudo apt install -f

# Bitcoin build
# sudo apt install autoconf libboost-all-dev libevent-dev -y
# sudo apt-get install libdb++-dev -y

# # # Install python
# # sudo apt install software-properties-common
# # sudo add-apt-repository ppa:deadsnakes/ppa
# # sudo apt update -y
# sudo apt install python3-pip -y
# sudo apt install flake8 -y
# sudo apt install python3.8-venv -y
# pip install pyright  # nvim-lspconfig dependency
# 
# # Poetry env install: https://python-poetry.org/docs/#installing-with-the-official-installer
# curl -sSL https://install.python-poetry.org | python3 -

# Install neovim - neovim is installed in 1-provision-env.sh as `sudo apt install neovim` installs
# old version
sudo apt install libtool automake libncurses5-dev g++ snmp -y

# Niceities
sudo apt install tldr wget -y
# Better search to supplement fzf vim plugin
sudo apt install fzf silversearcher-ag -y

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# Source cargo
. "$HOME/.cargo/env"

## Install useful rustup tools and global crates
rustup install nightly
rustup component add rustfmt
rustup component add clippy
rustup component add rust-src

cargo install just ripgrep fd-find cargo-watch watchexec-cli

# Set global git username + email
git config --global user.name "Rachel Rybarczyk"
git config --global user.email "EMAIL"

# Force symlink bash scripts
 ln -sf ~/.dots/etc/bashrc ~/.bashrc
 ln -sf ~/.dots/etc/bash_profile ~/.bash_profile
 ln -sf ~/.dots/etc/profile ~/.profile

# DotBot Setup
git submodule update --init --recursive .
./dotbot/bin/dotbot -c install.conf.yaml

source ~/.bashrc
