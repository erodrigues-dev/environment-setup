#!/bin/bash

echo '# initialize setup:'

NAME=Elton Rodrigues
EMAIL=erodrigues.dev@gmail.com

echo '>> apt-get update'

sudo apt-get update -y
sudo apt-get upgrade -y

echo '>> installing...'

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

echo '------------ nvm, node and npm'
sudo curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh -o /tmp/install_nvm.sh
bash /tmp/install_nvm.sh

echo '------------ nvm'
echo 'export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' >> ~/.bashrc
  
source ~/.bashrc

echo '------------ node LTS'
nvm install --lts
nvm use --lts

echo '------------ yarn'
npm install --global yarn

echo '------------ docker'
sudo curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
bash /tmp/get-docker.sh

# docker post install
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker 

echo '------------ docker-compose'
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo '------------ gnome tweaks'
sudo apt-get install gnome-tweaks gnome-shell-extensions -y

echo '------------ insomnia'
echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list
sudo apt-get update -y
sudo apt-get install insomnia -y

echo '------------ flatpak'
sudo apt install flatpak
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo '------------ spotify'
flatpak install flathub com.spotify.Client -y

echo '------------ dbeaver (multiple sql client)'
flatpak install flathub io.dbeaver.DBeaverCommunity -y

echo '------------ anydesk (remote desktop)'
flatpak install flathub com.anydesk.Anydesk -y

echo '------------ vscode'
flatpak install flathub com.visualstudio.code -y

echo '------------ teams'
flatpak install flathub com.microsoft.Teams -y

echo '------------ meld (merge tool)'
flatpak install flathub org.gnome.meld -y

echo '------------ flameshot (printscreen util)'
flatpak install flathub org.flameshot.Flameshot

echo '------------ copyq (clipboard util)'
flatpak install flathub com.github.hluk.copyq

echo '------------ peek (gravador de tela)'
flatpak install flathub com.uploadedlobster.peek
  
echo '------------ git settings'
git config --global user.name $NAME
git config --global user.email $EMAIL
git config --global pull.rebase true
git config --global core.filemode false
git config --global merge.tool meld
git config --global diff.tool meld
git config --global mergetool.keepbackup false


echo '------------ git-flow'
sudo apt-get install git-flow -y


echo '----------- code extensions'
code --install-extension aaron-bond.better-comments
code --install-extension dbaeumer.vscode-eslint
code --install-extension dracula-theme.theme-dracula
code --install-extension eamodio.gitlens
code --install-extension editorconfig.editorconfig
code --install-extension eg2.vscode-npm-script
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.auto-rename-tag
code --install-extension johnpapa.vscode-peacock
code --install-extension jpoissonnier.vscode-styled-components
code --install-extension kamikillerto.vscode-colorize
code --install-extension mhutchie.git-graph
code --install-extension mikestead.dotenv
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension PKief.material-icon-theme
code --install-extension ritwickdey.liveserver
code --install-extension tyriar.lorem-ipsum
code --install-extension yzhang.markdown-all-in-one

echo '-----------------------------'  
echo '>> done!'
