#!/bin/bash
sudo pacman -Syu

#install essential
sudo pacman -S base-devel yay snapd git
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

#install go
sudo pacman -S go
export GOPATH=~/workspace/go/

#install vscode and git client
sudo snap install code --classic
sudo snap install gitkraken --classic

#install neovim
pip3 install pynvim
sudo pacman -S neovim

#install browser
sudo pacman -S chromium 

#install nodejs
sudo pacman -S nodejs npm

#install docker
sudo pacman -S docker

#install wine 
sudo pacman -S wine winetricks

#install util
sudo pacman -S evince atool rhythmbox neofetch plank
git clone https://aur.archlinux.org/ulauncher.git && cd ulauncher && makepkg -is

#install discord
sudo pacman -S discord

#install llvm
cd /opt
sudo wget https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang+llvm-10.0.0-aarch64-linux-gnu.tar.xz
sudo tar -xvzf ./clang+llvm-10.0.0-aarch64-linux-gnu.tar.xz
export PATH=$PATH:/opt/clang+llvm-10.0.0-aarch64-linux-gnu/bin

#install latex
sudo pacman -S texlive-langjapanese texlive-most texlive-latexextra

#util
bash ./common.sh
