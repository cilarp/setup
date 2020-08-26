setupDir=$(pwd)
cd /opt
sudo git clone https://github.com/b-ryan/powerline-shell
cd powerline-shell
sudo python setup.py install
cat $setupDir/powerline_bash | echo >> ~/.bashrc
cd /opt
sudo git clone https://github.com/powerline/fonts
cd fonts
sudo ./install.sh
