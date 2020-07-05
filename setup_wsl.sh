#! /bin/bash
bash ./setup.sh
cd
dircolors -p > .dircolors
echo "please set up your dircolor"
vim .dircolors
ln -s /mnt/d/dev/ dev
