#! /bin/bash
bash ./setup.sh
cd
dircolors -p > .dircolors
echo "please set up your dircolor"
echo "eval $(dircolors -b ~/.dircolors)" >> .bashrc
ln -s /mnt/d/dev/ dev