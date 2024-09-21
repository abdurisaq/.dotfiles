#!/usr/bin/env bash
set -e  # Exit immediately if a command exits with a non-zero status

NEOVIM_VERSION="v0.10.1"  # Replace with the version you want
NEOVIM_URL="https://github.com/neovim/neovim/releases/download/${NEOVIM_VERSION}/nvim-linux64.tar.gz"
INSTALL_DIR="/usr/local/nvim-linux64"

# Check if Neovim is already installed and exit if so
if command -v nvim >/dev/null 2>&1; then
    echo "Neovim is already installed at $(command -v nvim)"
    exit 0
fi

# Download the tarball
echo "Downloading Neovim ${NEOVIM_VERSION}..."
wget $NEOVIM_URL -O nvim-linux64.tar.gz

# Extract the tarball
echo "Extracting Neovim..."
tar -xzf nvim-linux64.tar.gz

# Move the extracted files to /usr/local
echo "Installing Neovim..."
sudo mv nvim-linux64 $INSTALL_DIR

# Symlink the nvim binary to make it globally accessible
echo "Creating symlink for Neovim..."
sudo ln -sf $INSTALL_DIR/bin/nvim /usr/local/bin/nvim

# Clean up downloaded tarball
rm -f nvim-linux64.tar.gz

echo "Neovim ${NEOVIM_VERSION} installed successfully!"
