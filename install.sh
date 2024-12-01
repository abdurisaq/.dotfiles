#!/usr/bin/env bash

NEOVIM_VERSION="v0.10.1"
NEOVIM_URL="https://github.com/neovim/neovim/releases/download/${NEOVIM_VERSION}/nvim-linux64.tar.gz"
INSTALL_DIR="/usr/local/nvim-linux64"

detect_package_manager() {
    if command -v pacman >/dev/null 2>&1; then
        echo "pacman"
    elif command -v apt-get >/dev/null 2>&1; then
        echo "apt"
    elif command -v dnf >/dev/null 2>&1; then
        echo "dnf"
    else
        echo "unknown"
    fi
}

which wget && echo "wget already installed" || (
    echo "Installing wget..."
    PACKAGE_MANAGER=$(detect_package_manager)
    case $PACKAGE_MANAGER in
        pacman)
            sudo pacman -Sy wget
            ;;
        apt)
            sudo apt update && sudo apt install -y wget
            ;;
        dnf)
            sudo dnf install -y wget
            ;;
        *)
            echo "Unknown package manager. Please install wget manually."
            exit 1
            ;;
    esac
)

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

which unzip && echo "unzip already installed" || (
    echo "Installing unzip..."
    PACKAGE_MANAGER=$(detect_package_manager)
    case $PACKAGE_MANAGER in
        pacman)
            sudo pacman -Sy unzip
            ;;
        apt)
            sudo apt update && sudo apt install -y unzip
            ;;
        dnf)
            sudo dnf install -y unzip
            ;;
        *)
            echo "Unknown package manager. Please install unzip manually."
            exit 1
            ;;
    esac
)

ln -sf "$HOME/.dotfiles/.config/nvim" "$HOME/.config/nvim" && echo "Symlink Created: ~/.config -> $HOME/.dotfiles/.config" || echo "Failed to create symlink."

PACKAGE_MANAGER=$(detect_package_manager)
case $PACKAGE_MANAGER in
    pacman)
        sudo pacman -Sy zsh
        ;;
    apt)
        sudo apt update && sudo apt install -y zsh
        ;;
    dnf)
        sudo dnf install -y zsh
        ;;
    *)
        echo "Unknown package manager. Please install zsh manually."
        exit 1
        ;;
esac
echo "Zsh installed successfully."

ln -sf "$HOME/.dotfiles/.zshrc" "$HOME/.zshrc" && echo "Symlink created: ~/.zshrc -> $HOME/.dotfiles/.zshrc" || echo "Failed to create symlink."

chsh -s $(which zsh) && echo "Zsh set as the default shell." || echo "Failed to set Zsh as the default shell."

ln -sf "$HOME/.dotfiles/.gitconfig" "$HOME/.gitconfig" && echo "Symlink created: ~/.gitconfig -> $HOME/.dotfiles/.gitconfig" || echo "Failed to create symlink."

PACKAGE_MANAGER=$(detect_package_manager)
case $PACKAGE_MANAGER in
    pacman)
        sudo pacman -Sy tmux
        ;;
    apt)
        sudo apt update && sudo apt install -y tmux
        ;;
    dnf)
        sudo dnf install -y tmux
        ;;
    *)
        echo "Unknown package manager. Please install tmux manually."
        exit 1
        ;;
esac
echo "Tmux installed."

ln -sf "$HOME/.dotfiles/.tmux/.tmux.conf" "$HOME/.tmux.conf" && echo "Symlink created: ~/.tmux.conf -> $HOME/.dotfiles/.tmux/.tmux.conf" || echo "Failed to create symlink."

command -v tmux && tmux source-file ~/.tmux.conf || echo "tmux is not installed"
