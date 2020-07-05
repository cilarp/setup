#! /bin/bash
bash ./setup.sh
cd
dircolors -p > .dircolors
echo "please set up your dircolor"
vim .dircolors
echo "eval $(dircolors -b ~/.dircolors)" >> .bashrc
source .bashrc
ln -s /mnt/d/dev/ dev
