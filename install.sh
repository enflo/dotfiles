#!/bin/bash

set -e

FILE="$PWD/install.sh"
test -e $FILE || { echo "Please run script from the install.sh directory"; exit; }

# install all the things
./main.sh
./apps.sh

# Move some files to $HOME
## Bash Config
mv /scripts//bash $HOME/bash_settings
mv /scripts/bash/.bashrc $HOME
mv /scripts/bash/.bash_aliases $HOME
mv /scripts/bash/.functions $HOME
mv /scripts/bash/.bash_profile $HOME

## Git config
mv /scripts/git/.gitignore_global $HOME
mv /scripts/git/.gitconfig $HOME
