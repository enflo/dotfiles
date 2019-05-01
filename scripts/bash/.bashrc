# include .bashrc if it exists
if [ -f $HOME/bash_settings/.bashrc_aliases ]; then
    . $HOME/bash_settings/.bashrc_aliases
fi

if [ -f $HOME/bash_settings/.bash_autocomplete ]; then
    . $HOME/bash_settings/.bash_autocomplete
fi

if [ -f $HOME/bash_settings/.colors ]; then
    . $HOME/bash_settings/.colors
fi

if [ -f $HOME/bash_settings/.bashrc_logout ]; then
    . $HOME/bash_settings/.bashrc_logout
fi

if [ -f $HOME/bash_settings/.bashrc_options ]; then
    . $HOME/bash_settings/.bashrc_options
fi

if [ -f $HOME/bash_settings/.bashrc_functions ]; then
    . $HOME/bash_settings/.bashrc_functions
fi

if [ -f $HOME/bash_settings/.bashrc_promt ]; then
    . $HOME/bash_settings/.bashrc_promt
fi