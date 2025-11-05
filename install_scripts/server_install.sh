#!/bin/env bash

#==============================================================#
# Define script variables
script_path="~/dotfiles_work/install_scripts/"
dots_path="~/dotfiles_work/"
operatingSystem=$(grep -i "PRETTY_NAME" </etc/os-release | awk -F'"' '{print $2}')

DOTS="${HOME}/dotfiles_server"
DOTPKG="${DOTS}/package_lists"
DOTSCRIPTS="${DOTS}/install_scripts"
DOTMODS="${DOTSCRIPTS}/modules"

# Sudo access
sudo echo "Sudo access granted for this script"
while true; do
  sudo -v
  sleep 240
done &

# Store the PID of the background process for this install script
SUDO_KEEP_ALIVE_PID=$!
#==============================================================#

if [[ "$operatingSystem" == "Arch Linux" ]]; then
  # Neovim Install
  cd $HOME
  bash -c "${DOTMODS}/lazyvim.sh"

  # Paru Install
  cd $HOME
  bash -c "${DOTMODS}/paru.sh"

  # Install Packages
  paru -S $(awk -v RS= '{$1=$1}1' ${DOTPKG}/archPackages.txt)

  # Zoxide Setup
  /usr/bin/zoxide init nushell >~/.zoxide.nu

  # Oh-My-ZSH
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  # Stow files
  cd $HOME/dotfiles_server
  bash -c "${DOTMODS}/stow.sh"
  bash -c "${DOTMODS}/gitignore_theming.sh"

  # SSH config setup
  bash -c "${DOTMODS}/ssh_config.sh"

  # Change Shell
  chsh -s /usr/bin/zsh

  # Kill process
  kill $SUDO_KEEP_ALIVE_PID
fi
