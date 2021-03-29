#!/bin/bash -x

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

ln -s $DOTFILES_DIR/.alacritty.yml ~/.alacritty.yml
ln -s $DOTFILES_DIR/.editorconfig ~/.editorconfig
ln -s $DOTFILES_DIR/starship.toml ~/.config/starship.toml
ln -s $DOTFILES_DIR/.gitconfig ~/.gitconfig
ln -s $DOTFILES_DIR/.tmux.conf ~/.tmux.conf

ln -s $DOTFILES_DIR/nvim/* ~/.config/nvim/

ln -s $DOTFILES_DIR/fish/* ~/.config/fish/
