#!/usr/bin/env bash

cd $HOME/dotfiles_work

rm -rf ~/.bash_history \
  ~/.bash_logout \
  ~/.bash_profile \
  ~/.bashrc \
  ~/.config/.dmenurc \
  ~/.config/Kvantum \
  ~/.config/aerospace \
  ~/.config/alacritty \
  ~/.config/broot \
  ~/.config/cava \
  ~/.config/cliphist \
  ~/.config/containers \
  ~/.config/dconf \
  ~/.config/ghostty \
  ~/.config/gtk-3.0 \
  ~/.config/gtk-4.0 \
  ~/.config/gtkrc \
  ~/.config/gtkrc-2.0 \
  ~/.config/hypr \
  ~/.config/jj \
  ~/.config/kanata \
  ~/.config/karabiner \
  ~/.config/nushell \
  ~/.config/nvim \
  ~/.config/nwg-look \
  ~/.config/qt5ct \
  ~/.config/qt6ct \
  ~/.config/rofi \
  ~/.config/silicon \
  ~/.config/starship.toml \
  ~/.config/swaylock \
  ~/.config/swaync \
  ~/.config/tmux \
  ~/.config/vim \
  ~/.config/wal \
  ~/.config/wallpapers \
  ~/.config/wallust \
  ~/.config/waybar \
  ~/.config/waypaper \
  ~/.config/wezterm \
  ~/.config/wlogout \
  ~/.ideavimrc \
  ~/.config/xdg-desktop-portal \
  ~/.profile \
  ~/.tmux \
  ~/.vimrc \
  ~/.zshenv \
  ~/.zshrc

stow .
