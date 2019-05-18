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
    $sudo apt install libcurl3
    $sudo ln -s /usr/lib64/libcurl.so.4 /usr/lib64/libcurl-gnutls.so.4
    wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
    $sudo dpkg -i gitkraken-amd64.deb
fi

# Communication
if ! [ -x "$(command -v slack )" ]; then
    $sudo apt-get upgrade slack-desktop
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

# CTOP
$sudo wget https://github.com/bcicen/ctop/releases/download/v0.7.2/ctop-0.7.2-linux-amd64 -O /usr/local/bin/ctop
$sudo chmod +x /usr/local/bin/ctop

# Spotify
if ! [ -x "$(command -v spotify )" ]; then
    $sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
    echo deb http://repository.spotify.com stable non-free | $sudo tee /etc/apt/sources.list.d/spotify.list
    $sudo apt update apt install -y spotify-client
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
    $sudo apt install -y firefox
fi

## Zoom
if ! [ -x "$(command -v zoom )" ]; then
    wget -O /tmp/zoom.deb https://zoom.us/client/latest/zoom_amd64.deb
    $sudo apt update && sudo apt install -y libxcb-xtest0
    $sudo dpkg -i /tmp/zoom.deb
fi
