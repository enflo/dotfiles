#!/bin/bash

set -e

FILE="$PWD/install.sh"
test -e $FILE || { echo "Please run script from the install.sh directory"; exit; }

# install all the things
./main.sh
./apps.sh

# Move some files to $HOME
## Bash Config
echo $PWD
cp scripts/bash/.bashrc $HOME
cp scripts/bash/.bash_profile $HOME
cp -R scripts/bash $HOME/bash_settings


## Git config
cp scripts/git/.gitignore_global $HOME
cp scripts/git/.gitconfig $HOME
