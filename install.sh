#!/usr/bin/env bash

NEOVIM_VERSION="v0.10.1"  # Replace with the version you want
NEOVIM_URL="https://github.com/neovim/neovim/releases/download/${NEOVIM_VERSION}/nvim-linux64.tar.gz"
INSTALL_DIR="/usr/local/nvim-linux64"


if command -v nvim >/dev/null 2>&1; then
    echo "Neovim is already installed at $(command -v nvim)"
else

    echo "Downloading Neovim ${NEOVIM_VERSION}..."
    wget $NEOVIM_URL -O nvim-linux64.tar.gz

    echo "Extracting Neovim..."
    tar -xzf nvim-linux64.tar.gz

        echo "Installing Neovim..."
    sudo mv nvim-linux64 $INSTALL_DIR

    echo "Creating symlink for Neovim..."
    sudo ln -sf $INSTALL_DIR/bin/nvim /usr/local/bin/nvim

    rm -f nvim-linux64.tar.gz

    echo "Neovim ${NEOVIM_VERSION} installed successfully!"
fi

ln -sf "$HOME/.dotfiles/.config" "$HOME/.config" && echo "Symlink Created: ~/.config -> $HOME/.dotfiles/.config" || echo "Failed to create symlink."

sudo apt update && sudo apt install -y zsh && echo "Zsh installed successfully." || echo "Zsh installation failed."

ln -sf "$HOME/.dotfiles/.zshrc" "$HOME/.zshrc" && echo "Symlink created: ~/.zshrc -> $HOME/.dotfiles/.zshrc" || echo "Failed to create symlink."

chsh -s $(which zsh) && echo "Zsh set as the default shell." || echo "Failed to set Zsh as the default shell."

ln -sf "$HOME/.dotfiles/.gitconfig" "$HOME/.gitconfig" && echo "Symlink created: ~/.gitconfig -> $HOME/.dotfiles/.gitconfig" || echo "Failed to create symlink."

sudo apt install -y tmux && echo "Tmux installed" || echo "Tmux installation failed."

ln -sf "$HOME/.dotfiles/.tmux/.tmux.conf" "$HOME/.tmux.conf" && echo "Symlink created: ~/.tmux.conf -> $HOME/.dotfiles/.tmux/.tmux.conf" || echo "Failed to create symlink."

command -v tmux && tmux source-file ~/.tmux.conf || echo "tmux is not installed"
