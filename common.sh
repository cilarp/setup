#!/bin/bash

#git setting
git config --global user.name "cilarp"
git config --global user.email "cilarp914@gmail.com"

#install rust and setting
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env
rustup component add rls rust-analysis rust-src
cargo install exa hexyl procs fd-find ripgrep bat cargo-atcoder cargo-make cargo-generate
echo "alias ils='exa'"             >> ~/.bashrc
echo "alias ila='exa -a'"          >> ~/.bashrc
echo "alias ill='exa -ahl --git'"  >> ~/.bashrc 
echo "alias icat='bat'"            >> ~/.bashrc 
echo "alias iod='hexyl'"           >> ~/.bashrc 
echo "alias ips='procs'"           >> ~/.bashrc 
echo "alias ifind='fd'"            >> ~/.bashrc 
echo "alias igrep='rg'"            >> ~/.bashrc 
curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh
mkdir ~/.cache/cargo-atcoder
touch ~/.cache/cargo-atcoder/setting.sh


#install powerline-shell
cd /opt
sudo git clone https://github.com/b-ryan/powerline-shell
cd powerline-shell
python setup.py install
echo "function _update_ps1() {"                                           >> ~/.bashrc
echo "    PS1=$(powerline-shell $?)"                                      >> ~/.bashrc
echo "}"                                                                  >> ~/.bashrc
echo ""                                                                   >> ~/.bashrc
echo "if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then"  >> ~/.bashrc
echo "    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND""                  >> ~/.bashrc
echo "fi"                                                                 >> ~/.bashrc
cd /opt
sudo git clone https://github.com/powerline/fonts
cd fonts
sudo ./install.sh

#setup ssh
ssh-keygen -t rsa -b 4096 -C "cilarp914@gmail.com"
chmod 600 ~/.ssh/id_rsa_github
echo "Host github"                         >> ~/.ssh/config
echo "  HostName github.com"               >> ~/.ssh/config
echo "  User git"                          >> ~/.ssh/config
echo "  IdentityFile ~/.ssh/id_rsa_github" >> ~/.ssh/config
