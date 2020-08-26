#!/bin/bash
origin=$(pwd)

#Change repojitory and update
bash ./ubuntu18/ch_repo_to_jp.sh

read -n1 -p "do u wanna install lldb? (y/N): " yn
if [[ $yn = [yY] ]]; then
    sudo apt install -y lldb 
fi
echo ""

#install essential
cd $origin
bash ./ubuntu18/essential.sh
echo ""

#git: install and setting
cd $origin
bash ./ubuntu18/git.sh
bash ./common/git.sh
echo ""

#llvm: install
read -n1 -p "do u wanna install llvm? (y/N): " yn
cd $origin
if [[ $yn = [yY] ]]; then
    bash ./ubuntu18/llvm.sh
fi
echo ""

#mono: install and setup
read -n1 -p "do u wanna install mono? (y/N): " yn
cd $origin
if [[ $yn = [yY] ]]; then
    bash ./ubuntu18/mono.sh
fi
echo ""

#rust: install and setup
read -n1 -p "do u wanna install rust? (y/N): " yn
cd $origin
if [[ $yn = [yY] ]]; then
    sudo apt install -y libssl-dev
    sudo apt-get install pkg-config
    sudo apt install -y curl
    bash ./common/rust.sh
fi
echo ""

#vim: install and set up
read -n1 -p "do u wanna install vim? (y/N): " yn
cd $origin
if [[ $yn = [yY] ]]; then
    bash ./ubuntu18/vim.sh
fi
echo ""

#neovim: instal and setup
read -n1 -p "do u wanna install neovim? (y/N): " yn
cd $origin
if [[ $yn = [yY] ]]; then
    bash ./ubuntu18/nvim.sh
fi
echo ""

#java: install
read -n1 -p "do u wanna install java? (y/N): " yn
cd $origin
if [[ $yn = [yY] ]]; then
    sudo apt install -y openjdk-11-jdk
fi
echo ""

#latex: install and setup
read -n1 -p "do u wanna install latex? (y/N): " yn
cd $origin
if [[ $yn = [yY] ]]; then
    bash ./ubuntu18/latex.sh
fi
echo ""

#powerline: install
read -n1 -p "do u wanna install powerline-shell? (y/N): " yn
cd $origin
if [[ $yn = [yY] ]]; then
    sudo apt install -y python3-setuptools python-setuptools
    bash ./common/powerline.sh
fi
echo ""

#ssh: setup
cd $origin
bash ./common/ssh.sh
