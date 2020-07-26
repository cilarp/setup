sudo apt install -y python3-pip m4 cmake automake unzip gettext 
pip3 install pynvim
cd /opt/
sudo git clone https://github.com/neovim/neovim.git
cd neovim
sudo make CMAKE_BUILD_TYPE=Release
sudo make install
cd
