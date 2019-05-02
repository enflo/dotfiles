# Install Shell bash promt
echo "----------------------------------------------------------------------"
echo "For the installation you have two options"
echo "  a) Bash  "
echo "  b) oh-my-bash  "
read -p 'Which option do you prefer (a /b):' option
echo
echo "You have selected the option $option. This option will be configured"
echo "-----------------------------------------------------------------------"



## Install oh-my-bash
install_oh (){
### Docs: https://github.com/ohmybash/oh-my-bash
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

## Install agnoster for bash
### Docs: https://github.com/speedenator/agnoster-bash , but i use my config file
    git clone https://github.com/speedenator/agnoster-bash.git $HOME/.oh-my-bash/custom/themes/agnoster
    cp  scripts/oh-my-bash/agnoster.theme.sh $HOME/.oh-my-bash/custom/themes/agnoster/agnoster.theme.sh

## Add custom aliases
    cp scripts/oh-my-bash/.custom.aliases.sh $HOME/.oh-my-bash/custom/aliases/custom.aliases.sh

## Change .bashrc for custom bashrc
    cp scripts/oh-my-bash/.bashrc $HOME/.bashrc
}

## Bash Config
install_bash (){
    cp scripts/bash/.bashrc $HOME
    cp scripts/bash/.bash_profile $HOME
    cp -R scripts/bash $HOME/bash_settings
}

case "$option" in
    a) install_bash ;;
    b) install_oh ;;
    *) echo "Invalid Option"
        exit 1;;
esac

## Git config
cp scripts/git/.gitignore_global $HOME
cp scripts/git/.gitconfig $HOME