cd /opt
sudo git clone https://github.com/b-ryan/powerline-shell
cd powerline-shell
sudo python setup.py install
echo "function _update_ps1() {"                                           >> ~/.bashrc
echo "    PS1=$(powerline-shell $?)"                                      >> ~/.bashrc
echo "}"                                                                  >> ~/.bashrc
echo ""                                                                   >> ~/.bashrc
echo "if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then"  >> ~/.bashrc
echo "    PROMPT_COMMAND=\"_update_ps1; $PROMPT_COMMAND\""                    >> ~/.bashrc
echo "fi"                                                                 >> ~/.bashrc
cd /opt
sudo git clone https://github.com/powerline/fonts
cd fonts
sudo ./install.sh
