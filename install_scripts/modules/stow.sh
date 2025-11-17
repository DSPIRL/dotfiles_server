#!/usr/bin/env bash

cd $HOME/dotfiles_server

rm -rf ~/.bash_history \
  ~/.bash_logout \
  ~/.bash_profile \
  ~/.bashrc \
  ~/.config/aerospace \
  ~/.config/alacritty \
  ~/.config/containers \
  ~/.config/ghostty \
  ~/.config/jj \
  ~/.config/kanata \
  ~/.config/karabiner \
  ~/.config/nushell \
  ~/.config/nvim \
  ~/.config/silicon \
  ~/.config/starship.toml \
  ~/.config/tmux \
  ~/.config/vim \
  ~/.config/wezterm \
  ~/.ideavimrc \
  ~/.profile \
  ~/.tmux \
  ~/.vimrc \
  ~/.zshenv \
  ~/.zshrc

stow .
