#!/usr/bin/env bash

NEOVIM_VERSION="v0.10.1"  # Replace with the version you want
NEOVIM_URL="https://github.com/neovim/neovim/releases/download/${NEOVIM_VERSION}/nvim-linux64.tar.gz"

# Download the tarball
echo "Downloading Neovim ${NEOVIM_VERSION}..."
wget $NEOVIM_URL -O nvim-linux64.tar.gz

# Extract the tarball
echo "Extracting Neovim..."
tar -xzf nvim-linux64.tar.gz

# Move the extracted files to /usr/local
echo "Installing Neovim..."
sudo mv nvim-linux64 /usr/local/

# Symlink the nvim binary to make it globally accessible
sudo ln -sf /usr/local/nvim-linux64/bin/nvim /usr/local/bin/nvim
