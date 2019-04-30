#!/bin/bash

set -e

## UPDATE
sudo apt update
sudo apt upgrade -y

## BASE INSTALL
sudo apt install software-properties-common git ca-certificates curl gdebi-core build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget apt-transport-https

## INSTALL PYTHON 3.7
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.7

## Python
sudo apt install python-pip python3-pip
pip install pipenv
pip3 install pipenv

# Powerline
pip install --user git+git://github.com/powerline/powerline
pip install --user powerline-status
pip install --user ipython

# vim runtime
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
