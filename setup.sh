#!/bin/bash -x

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

ln -s $DOTFILES_DIR/.editorconfig ~/.editorconfig
ln -s $DOTFILES_DIR/starship.toml ~/.config/starship.toml
ln -s $DOTFILES_DIR/.gitconfig ~/.gitconfig
ln -s $DOTFILES_DIR/.tmux.conf ~/.tmux.conf

mkdir -p ~/.config/nvim
ln -s $DOTFILES_DIR/nvim/* ~/.config/nvim/

mkdir -p ~/.config/fish
ln -s $DOTFILES_DIR/fish/* ~/.config/fish/

mkdir -p ~/.config/zellij
ln -s $DOTFILES_DIR/zellij/* ~/.config/zellij/

mkdir -p ~/.config/alacritty
ln -s $DOTFILES_DIR/alacritty/.alacritty.toml ~/.alacritty.toml
ln -s $DOTFILES_DIR/alacritty/* ~/.config/alacritty/
