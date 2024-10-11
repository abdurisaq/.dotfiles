#!/usr/bin/env bash
set -e  # Exit immediately if a command exits with a non-zero status

NEOVIM_VERSION="v0.10.1"  # Replace with the version you want
NEOVIM_URL="https://github.com/neovim/neovim/releases/download/${NEOVIM_VERSION}/nvim-linux64.tar.gz"
INSTALL_DIR="/usr/local/nvim-linux64"

command -v nvim >/dev/null 2>&1 && echo "Neovim is already installed at $(command -v nvim)" && exit 0


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

ln -sf "$HOME/.dotfiles/.config" "$HOME/.config" && echo "Symlink Created: ~/.config -> $HOME/.dotfiles/.config" || echo "Failed to create symlink."

sudo apt update && sudo apt install -y zsh && echo "Zsh installed successfully." || echo "Zsh installation failed."

ln -sf "$HOME/.dotfiles/.zshrc" "$HOME/.zshrc" && echo "Symlink created: ~/.zshrc -> $HOME/.dotfiles/.zshrc" || echo "Failed to create symlink."
