##### RUST #####
if [[ $(bash -c 'ls -a $HOME | grep ".cargo"') ]]; then
    export XDG_CONFIG_HOME="${HOME}/.config"
    export CARGO_HOME="${HOME}/.cargo"
    export PATH="$CARGO_HOME/bin:$PATH"
fi

if [ $(uname -s) = "Linux" ]; then
    export XDG_DATA_DIRS
    XDG_DATA_DIRS="${new_dirs:+${new_dirs}:}${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
fi

if [ $(uname -s) = "Darwin" ]; then
    export XDG_CONFIG_HOME="/Users/raphi/.config"
fi

##### CUSTOM ENVIRONMENT VARIABLES #####
export USER_TERMINAL=alacritty
