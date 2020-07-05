#! /bin/bash
bash ./setup.sh
cd
dircolors -p > .dircolors
echo "please set up for dircolor"
echo "eval $(dircolors -b ~/.dircolors)" >> .bashrc
ln -s /mnt/d/dev/ dev