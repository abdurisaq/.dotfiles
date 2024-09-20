#!/usr/bin/env bash


echo "Downloading Neovim AppImage..."
wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage -O /tmp/nvim.appimage

# Make the AppImage executable
echo "Making Neovim executable..."
chmod u+x /tmp/nvim.appimage

# Move the AppImage to /usr/local/bin
echo "Moving Neovim to /usr/local/bin..."
sudo mv /tmp/nvim.appimage /usr/local/bin/nvim

# Check if Neovim was successfully installed
if [ -f /usr/local/bin/nvim ]; then
  echo "Neovim installed successfully!"
else
  echo "Error: Neovim installation failed."
fi

# Run Neovim to verify installation
echo "Launching Neovim..."
nvim --version
