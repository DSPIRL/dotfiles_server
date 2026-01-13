if [[ $(uname -s) = "Linux" ]]; then
  export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"
  export USER_TERMINAL=alacritty
  export TERM=alacritty
  export XDG_DATA_DIRS
  XDG_DATA_DIRS="${new_dirs:+${new_dirs}:}${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
  export QT_QPA_PLATFORMTHEME="qt5ct"
fi

if [[ $(uname -s) = "Darwin" ]]; then
  export USER_TERMINAL=alacritty

  # Added by LM Studio CLI (lms)
  export PATH="$PATH:$HOME/.lmstudio/bin"
  # End of LM Studio CLI section
fi

if [ -n "$BASH_VERSION" ]; then
  if [[ -f "$HOME/.bashrc" ]]; then
    . "$HOME/.bashrc"
  fi
fi

if [[ -d "$HOME/bin" ]]; then
  PATH="$HOME/bin:$PATH"
fi

if [[ -d "$HOME.local/bin" ]]; then
  PATH="$HOME/.local/bin:$PATH"
fi
