#!/bin/bash

set -e

sudo=''
if [ "$EUID" -ne 0 ]; then
    sudo="sudo"
fi

## UPDATE
$sudo apt update
$sudo apt upgrade -y

## BASE INSTALL
$sudo apt install -y software-properties-common git ca-certificates curl gdebi-core build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget apt-transport-https

## INSTALL PYTHON 3.7
if ! [ -x "$(command -v python3.7 )" ]; then
    $sudo add-apt-repository ppa:deadsnakes/ppa
    $sudo apt install -y python3.7
fi

## Python
if ! [ -x "$(command -v pip )" || -x "$(command -v pip3 )" ]; then
    $sudo apt install -y python3-pip
fi
$sudo pip3 install pipenv
$sudo pip install --upgrade pip

# Powerline
$sudo pip install --user git+git://github.com/powerline/powerline
$sudo pip install --user powerline-status
$sudo pip install --user ipython

# vim runtime
#VIM_FILE="~/.vim_runtime"
#if ! [ -d $VIM_FILE ]; then
#    echo "$VIM_FILE does not exist"
#    git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
#    sh ~/.vim_runtime/install_awesome_vimrc.sh
#fi

#tweak
$sudo add-apt-repository universe
$sudo apt update
$sudo apt install -y gnome-tweak-tool

#theme
$sudo add-apt-repository ppa:numix/ppa
$sudo apt update
$sudo apt install -y numix-icon-theme-circle
