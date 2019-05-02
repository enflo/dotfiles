#!/bin/bash

set -e

FILE="$PWD/install.sh"
test -e $FILE || { echo "Please run script from the install.sh directory"; exit; }

# install all the things
echo "Start of installation"
echo "---------------------------------------------------------"
echo "Basic installation"

./main.sh

echo "You have completed the basic installation"
echo "---------------------------------------------------------"
echo "APPS installation"

./apps.sh

echo "You have completed the APPS installation"
echo "---------------------------------------------------------"
echo "Shell promt installation"

./shell.sh

echo "You have completed the Shell promt installation"
echo "---------------------------------------------------------"
echo " INSTALLATION COMPELTE"
echo "have a nice day"