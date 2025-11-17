#!/bin/env bash

#==============================================================#
# Define script variables
script_path="~/dotfiles_server/install_scripts/"
dots_path="~/dotfiles_server/"
operatingSystem=$(grep -i ^"NAME" </etc/os-release | awk -F'"' '{print $2}')
echo $operatingSystem

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

if [[ "$operatingSystem" == "Ubuntu" ]]; then
    # Nushell prep (Setup Fury)
    curl -fsSL https://apt.fury.io/nushell/gpg.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/fury-nushell.gpg
    echo "deb https://apt.fury.io/nushell/ /" | sudo tee /etc/apt/sources.list.d/fury.list
    sudo apt update
    sudo apt install nushell

    # Carapace (Install through Fury)
    # /etc/apt/sources.list.d/fury.list
    echo "deb [trusted=yes] https://apt.fury.io/rsteube/ /" | sudo tee /etc/apt/sources.list.d/fury.list
    apt-get update && apt-get install carapace-bin

    # OhMyPosh Setup
    curl -s https://ohmyposh.dev/install.sh | bash -s


  # Neovim Install
  cd $HOME
  bash -c "${DOTMODS}/lazyvim.sh"

  # Install Packages
  sudo apt install $(awk -v RS= '{$1=$1}1' ${DOTPKG}/ubuntuPackages.txt)

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
fi

kill $SUDO_KEEP_ALIVE_PID
