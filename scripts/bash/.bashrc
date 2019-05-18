# include .bashrc if it exists
if [ -f $HOME/bash_settings/.bashrc_aliases ]; then
    source $HOME/bash_settings/.bashrc_aliases
fi

if [ -f $HOME/bash_settings/.bash_autocomplete ]; then
    source $HOME/bash_settings/.bash_autocomplete
fi

if [ -f $HOME/bash_settings/.colors ]; then
    source $HOME/bash_settings/.colors
fi

if [ -f $HOME/bash_settings/.bashrc_logout ]; then
    source $HOME/bash_settings/.bashrc_logout
fi

if [ -f $HOME/bash_settings/.bashrc_options ]; then
    source $HOME/bash_settings/.bashrc_options
fi

if [ -f $HOME/bash_settings/.bashrc_functions ]; then
    source $HOME/bash_settings/.bashrc_functions
fi

if [ -f $HOME/bash_settings/.bashrc_promt ]; then
    source $HOME/bash_settings/.bashrc_promt
fi