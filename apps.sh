#!/bin/bash

set -e

# Editors
## VSCODE
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt updates &&  apt install code
code --install-extension shan.code-settings-sync

# Git desktop app
snap install gitkraken

# Communication
snap install slack

# Docker
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update && apt install docker-ce
sudo systemctl status docker
sudo usermod -aG docker $USER

# Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Postman
sudo snap install postman

# Spotify
snap install spotify

# HTOP
sudo apt install htop

# Browsers
## Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo gdebi google-chrome-stable_current_amd64.deb

## Firefox
snap install firefox

## Zoom
wget -O /tmp/zoom.deb https://zoom.us/client/latest/zoom_amd64.deb
sudo apt update && sudo apt install libxcb-xtest0
sudo dpkg -i /tmp/zoom.deb
