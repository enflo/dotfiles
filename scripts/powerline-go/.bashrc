# include .bashrc if it exists
if [ -f $HOME/bash_settings/.bash_aliases ]; then
    source $HOME/bash_settings/.bash_aliases
fi

if [ -f $HOME/bash_settings/.bash_autocomplete ]; then
    source $HOME/bash_settings/.bash_autocomplete
fi

if [ -f $HOME/bash_settings/.bash_colors ]; then
    source $HOME/bash_settings/.bash_colors
fi

if [ -f $HOME/bash_settings/.bash_logout ]; then
    source $HOME/bash_settings/.bash_logout
fi

if [ -f $HOME/bash_settings/.bash_options ]; then
    source $HOME/bash_settings/.bash_options
fi

if [ -f $HOME/bash_settings/.bash_functions ]; then
    source $HOME/bash_settings/.bash_functions
fi

if [ -f $HOME/bash_settings/.bash_exports ]; then
    source $HOME/bash_settings/.bash_exports
fi

GOPATH=$HOME/go

function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go -error $? -modules-right kube -shorten-gke-names)"
}

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi