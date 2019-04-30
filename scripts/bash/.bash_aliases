##### ALIAS #####

##Common
alias q='exit'
alias c='clear'
alias h='history'
alias cs='clear'
alias p='cat'
alias pd='pwd'
alias t='time'
alias k='kill'
alias null='/dev/null'

##Directories
alias home='cd ~'
alias root='cd /'
alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'

##PYTHON
alias python='python3'
alias python3='python3.6'
alias pip='pip3'


## List
alias ll='ls -l'
alias lo='ls -o'
alias lh='ls -lh'
alias la='ls -la'
alias sl='ls'
alias l='ls'
alias s='ls'

##VIM
alias vimrc='code ~/.vimrc'

##BASH PROFILE
alias bashrc='code ~/.bash_profile'
alias loadbash='source ~/.bash_profile'

## GIT ALIAS
alias g='git'
alias gst='git status'
alias gcom='git commit -m'
alias gclone='git clone'
alias gsth='git stash'
alias lg='git log'
alias gu='git add -u'
alias gaddall='git add .'
alias gout='git checkout'

##DOCKER ALIAS
alias dl='docker ps -l -q'
alias dps='docker ps'
alias dpa='docker ps -a'
alias di='docker images'
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }     # Stop all containers
drm() { docker rm $(docker ps -a -q); }         # Remove all containers
dri() { docker rmi $(docker images -q); }       # Remove all images
dbu() { docker build -t=$1 .; }                 #Dockerfile build, e.g., $dbu tcnksm/test

## DOCKER-COMPOSE ALIAS
alias dc='docker-compose'
alias dcb='docker-compose build'
alias dcu='docker-compose up'
alias dclogs="docker-compose logs -f --tail 100"

# Get local IP.
alias local-ip="ifconfig \
                    | grep 'inet addr' \
                    | grep -v '127.0.0.1' \
                    | cut -d: -f2 \
                    | cut -d' ' -f1"
