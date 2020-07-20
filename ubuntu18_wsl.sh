#! /bin/bash
bash ./ubuntu.sh
cd
dircolors -p > .dircolors
echo "please set up your dircolor"
vim .dircolors
ln -s /mnt/d/dev/ dev
