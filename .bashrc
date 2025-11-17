#
# ~/.bashrc
#

##### CUSTOM FUNCTIONS #####
source ~/dotfiles_server/shell/custom_functions.sh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -lAFh --color=auto'
alias grep='grep --color=auto'
source ~/dotfiles_server/shell/aliases.sh
PS1='[\u@\h \W]\$ '

##### STARSHIP PROMPT #####
# eval "$(starship init bash)"

##### OhMyPosh PROMPT #####
eval "$(oh-my-posh init bash)"

##### COMPLETERS #####
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
source <(carapace _carapace)

##### EMACS #####
[[ -d ~/.config/emacs/bin ]] && export PATH="$HOME/.config/emacs/bin:$PATH"

if [[ "$hostOS" == "$macOS" ]]; then
  source $HOME/.config/broot/launcher/bash/br
fi

# Bind Ctrl+O to edit command in vim
bind '"\C-o": edit-and-execute-command'
