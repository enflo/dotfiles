#!/bin/bash

set -e

sudo=''
if [ "$EUID" -ne 0 ]; then
    sudo="sudo"
fi

# Editors
## VSCODE
if ! [ -x "$(command -v code )" ]; then
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    $sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    $sudo apt updates &&  apt install code -y
    code --install-extension shan.code-settings-sync
fi

# Git desktop app
if ! [ -x "$(command -v gitkraken )" ]; then
    $sudo snap install gitkraken
fi

# Communication
if ! [ -x "$(command -v slack )" ]; then
    $sudo snap install slack
fi

# Docker
if ! [ -x "$(command -v docker )" ]; then
    $sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    $sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    $sudo apt update && apt install -y docker-ce
    $sudo systemctl status docker
    $sudo usermod -aG docker $USER
fi

# Docker Compose
if ! [ -x "$(command -v docker-composer )" ]; then
    $sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    $sudo chmod +x /usr/local/bin/docker-compose
fi

# Postman
if ! [ -x "$(command -v postman )" ]; then
    $sudo snap install postman
fi

# Spotify
if ! [ -x "$(command -v spotify )" ]; then
    $sudo snap install spotify
fi

# HTOP
if ! [ -x "$(command -v htop )" ]; then
    $sudo apt install -y htop
fi

# Browsers
## Chrome
if ! [ -x "$(command -v chome )" ]; then
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    $sudo gdebi google-chrome-stable_current_amd64.deb
fi

## Firefox
if ! [ -x "$(command -v firefox )" ]; then
    snap install firefox
fi

## Zoom
if ! [ -x "$(command -v zoom )" ]; then
    wget -O /tmp/zoom.deb https://zoom.us/client/latest/zoom_amd64.deb
    $sudo apt update && sudo apt install -y libxcb-xtest0
    $sudo dpkg -i /tmp/zoom.deb
fi
