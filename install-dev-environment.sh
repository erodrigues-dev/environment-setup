#!/bin/bash

NAME=Elton Rodrigues
EMAIL=erodrigues.dev@gmail.com

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

# gnome tweaks
sudo apt-get install gnome-tweaks gnome-shell-extensions -y

# insomnia
echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list
sudo apt-get update -y
sudo apt-get install insomnia -y

# install flatpak 
sudo apt install flatpak
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# spotify 
flatpak install flathub com.spotify.Client -y

# dbeaver
flatpak install flathub io.dbeaver.DBeaverCommunity -y

# anydesk
flatpak install flathub com.anydesk.Anydesk -y

# vscode
flatpak install flathub com.visualstudio.code -y

# teams
flatpak install flathub com.microsoft.Teams -y

# meld
flatpak install flathub org.gnome.meld -y

# nvm, node and npm
sudo curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh -o /tmp/install_nvm.sh
bash /tmp/install_nvm.sh

echo 'export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' >> ~/.bashrc
  
source ~/.bashrc

nvm install --lts
nvm use --lts

# yarn 
npm install --global yarn

# docker
sudo curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
bash /tmp/get-docker.sh

# docker post install
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker 

# docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
  
# git settings

git config --global user.name $NAME
git config --global user.email $EMAIL
git config --global pull.rebase true
git config --global core.filemode false
git config --global merge.tool meld
git config --global diff.tool meld
git config --global mergetool.keepbackup false

  
