#!/bin/bash


#Change repojitory and update
echo "change directory to japanese"
sudo sed -i.bak -e "s/http:\/\/archive\.ubuntu\.com/http:\/\/jp\.archive\.ubuntu\.com/g" /etc/apt/sources.list
sudo apt update && sudo apt upgrade -y


#install essential
sudo apt install -y build-essential

#git setup
echo "set up git"
sudo add-apt-repository ppa:git-core/ppa
sudo apt update; apt install -y git
git config --global user.name "example"
git config --global user.email "example@example.com"
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
sudo apt install -y curl codelldb
exit
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env
echo "export PATH="$PATH:~/.cargo/bin"" >> ~/.bashrc
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

#install julia 1.0.5-lts
echo "set up julia"
cd /opt
sudo wget https://julialang-s3.julialang.org/bin/linux/x64/1.0/julia-1.0.5-linux-x86_64.tar.gz
sudo tar -xvzf julia-1.0.5-linux-x86\_64.tar.gz
echo "export PATH="$PATH:/opt/julia-1.0.5/bin/"" >> ~/.bashrc

exit
 
