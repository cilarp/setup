#!/bin/bash


#Change repojitory and update
echo "change directory to japanese"
sudo sed -i.bak -e "s/http:\/\/archive\.ubuntu\.com/http:\/\/jp\.archive\.ubuntu\.com/g" /etc/apt/sources.list
sudo apt update && sudo apt upgrade -y


#install essential
sudo apt install -y build-essential
sudo apt install neofetch

#git setup
echo "set up git"
sudo add-apt-repository ppa:git-core/ppa
sudo apt update; apt install -y git
git config --global user.name "cilarp"
git config --global user.email "cilarp914@gmail.com"
echo "You still need to set up ssh keys... Don't forget"

#mono setup
echo "set up mono"
sudo apt install -y gnupg ca-certificates
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update
sudo apt install -y mono-devel

#vim set up
echo "set up vim"
sudo apt install -y ncurses-dev lua5.2 lua5.2-dev luajit python-dev python3-dev ruby-dev
cd /opt/
sudo git clone https://github.com/vim/vim
cd vim/
sudo ./configure --with-features=huge --enable-multibyte --enable-luainterp=dynamic --enable-gpm --enable-cscope --enable-fontset --enable-fail-if-missing --prefix=/usr/local --enable-pythoninterp=dynamic --enable-python3interp=dynamic --enable-rubyinterp=dynamic 
sudo make
sudo make install
cd

#neovim setup
echo "set up neovim"
sudo apt install -y python3-pip m4 cmake automake unzip gettext
pip3 install pynvim
cd /opt/
sudo git clone https://github.com/neovim/neovim.git
cd neovim
sudo make CMAKE_BUILD_TYPE=Release
sudo make install
cd


#install rust and setup
echo "set up rust"
sudo apt install -y curl lldb
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env
rustup component add rls rust-analysis rust-src
cargo install exa hexyl procs fd-find ripgrep bat
echo "alias ils='exa'" >> ~/.bashrc
echo "alias ila='exa -a'" >> ~/.bashrc
echo "alias ill='exa -ahl --git'" >> ~/.bashrc 
echo "alias icat='bat'"  >> ~/.bashrc 
echo "alias iod='hexyl'" >> ~/.bashrc 
echo "alias ips='procs'" >> ~/.bashrc 
echo "alias ifind='fd'" >> ~/.bashrc 
echo "alias igrep='rg'" >> ~/.bashrc 

#install java11
echo "set up java"
sudo apt install -y openjdk-11-jdk

#install llvm
echo "set up llvm"
sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"


 
#install powerline-shell

cd /opt
sudo git clone https://github.com/b-ryan/powerline-shell
sudo apt isntall python3-setuptools python-setuptools
cd powerline-shell
python setup.py install


echo "function _update_ps1() {" >> ~/.bashrc
echo "    PS1=$(powerline-shell $?)" >> .bashrc
echo "}" >> .bashrc
echo "" >> .bashrc
echo "if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then" >> .bashrc
echo "    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"" >> .bashrc
echo "fi" >> .bashrc


cd /opt
sudo git clone https://github.com/powerline/fonts
cd fonts
sudo ./install.sh


#Macbuntu
sudo add-apt-repository ppa:noobslab/macbuntu
sudo apt update
sudo apt-get install macbuntu-os-icons-v1804
sudo apt-get install macbuntu-os-ithemes-v1804
sudo apt-get install slingscold
sudo apt-get install albert
sudo apt-get install macbuntu-os-plank-theme-v1804


#install software
cd ~/Download
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
wget https://go.microsoft.com/fwlink/?LinkID=760868
wget https://discord.com/api/download?platform=linux&format=deb
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.7.0-amd64.deb
wget https://file-fevwnujbqw.now.sh/Chirp-linux-x64.zip
