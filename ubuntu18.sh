#!/bin/bash


#Change repojitory and update
echo "change directory to japanese"
sudo sed -i.bak -e "s/http:\/\/archive\.ubuntu\.com/http:\/\/jp\.archive\.ubuntu\.com/g" /etc/apt/sources.list
sudo apt update && sudo apt upgrade -y



#add ppa
sudo add-apt-repository ppa:noobslab/macbuntu
sudo add-apt-repository ppa:git-core/ppa

#apt install
sudo apt install -y neofetch
sudo apt install -y build-essential
sudo apt install -y ncurses-dev lua5.2 lua5.2-dev luajit python-dev python3-dev ruby-dev 
sudo apt install -y git 
sudo apt install -y gnupg ca-certificates 
sudo apt install -y python3-pip m4 cmake automake unzip gettext 
sudo apt install -y curl lldb 
sudo apt install -y openjdk-11-jdk
sudo apt install -y texlive-full
sudo apt install -y macbuntu-os-icons-v1804 macbuntu-os-ithemes-v1804 slingscold albert macbuntu-os-plank-theme-v1804
sudo apt install -y python3-setuptools python-setuptools

#mono: install and setup
echo "set up mono"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update
sudo apt install -y mono-devel

#vim: install and set up
echo "set up vim"
cd /opt/
sudo git clone https://github.com/vim/vim
cd vim/
sudo ./configure --with-features=huge --enable-multibyte --enable-luainterp=dynamic --enable-gpm --enable-cscope --enable-fontset --enable-fail-if-missing --prefix=/usr/local --enable-pythoninterp=dynamic --enable-python3interp=dynamic --enable-rubyinterp=dynamic 
sudo make
sudo make install
cd

#neovim: instal and setup
echo "set up neovim"
pip3 install pynvim
cd /opt/
sudo git clone https://github.com/neovim/neovim.git
cd neovim
sudo make CMAKE_BUILD_TYPE=Release
sudo make install
cd

#install software
cd ~/Downloads
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
wget https://go.microsoft.com/fwlink/?LinkID=760868
wget https://discord.com/api/download?platform=linux&format=deb
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.7.0-amd64.deb
wget https://file-fevwnujbqw.now.sh/Chirp-linux-x64.zip

#install llvm
echo "llvm: install"
sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"

cd
bash ./common.sh
