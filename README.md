This repository contains my personal configurations for Neovim, Zsh, and Tmux, along with an automated installation script (install.sh) to set everything up.
I will continue to update as I explore more into linux.
Features

    Neovim: Configuration files for Neovim, including custom plugins and settings.
    Zsh: Installation and configuration of Zsh with a custom .zshrc, and plugin setup.
    Tmux: Tmux setup with .tmux.conf for a customized terminal multiplexer experience.

Installation
1. Clone the Repository

https://github.com/abdurisaq/dotfiles

2. cd dotfiles

3. Run the Installation Script

The install.sh script will download and install Neovim, Zsh, Tmux, and their associated configurations.

./install.sh

4. Reload your terminal

Once the installation is complete, restart your terminal or source the .zshrc:


source ~/.zshrc

What's Included
Neovim

    Plugins: Pre-configured plugins for an enhanced editing experience.
    Settings: Optimized keybindings and editor options.

Zsh

    Zsh Installation: Installs Zsh, if not already present.
    .zshrc for zsh customizations

Tmux

    Tmux Config: Custom .tmux.conf for a personalized terminal multiplexer setup.

Requirements

    git
    wget
    Linux/Unix-based system
[Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip) — Recommended for optimal viewing of icons and symbols in Neovim, Zsh, and Tmux.
Customization


Feel free to edit any of the config files in the nvim/, .zshrc, or tmux/ directories to suit your personal preferences.
