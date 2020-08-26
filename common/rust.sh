curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env
rustup component add rls rust-analysis rust-src
sudo apt install -y libssl-dev

read -n1 -p "do u wanna install exa? (y/N): " yn
echo ""
if [[ $yn = [yY] ]]; then
    cargo install exa 
    echo "alias ils='exa'"             >> ~/.bashrc
    echo "alias ila='exa -a'"          >> ~/.bashrc
    echo "alias ill='exa -ahl --git'"  >> ~/.bashrc 
fi

read -n1 -p "do u wanna install hexyl? (y/N): " yn
echo ""
if [[ $yn = [yY] ]]; then
    cargo install hexyl 
    echo "alias iod='hexyl'"           >> ~/.bashrc 
fi

read -n1 -p "do u wanna install procs? (y/N): " yn
echo ""
if [[ $yn = [yY] ]]; then
    cargo install procs 
    echo "alias ips='procs'"           >> ~/.bashrc 
fi

read -n1 -p "do u wanna install fd-find? (y/N): " yn
echo ""
if [[ $yn = [yY] ]]; then
    cargo install fd-find 
    echo "alias ifind='fd'"            >> ~/.bashrc 
fi

read -n1 -p "do u wanna install ripgrep? (y/N): " yn
echo "" 
if [[ $yn = [yY] ]]; then
    cargo install ripgrep
    echo "alias igrep='rg'"            >> ~/.bashrc     
fi

read -n1 -p "do u wanna install bat? (y/N): " yn
echo ""
if [[ $yn = [yY] ]]; then
    cargo install bat
    echo "alias icat='bat'"            >> ~/.bashrc 
fi

read -n1 -p "do u wanna install cargo-atcoder? (y/N): " yn
echo ""
if [[ $yn = [yY] ]]; then
    cargo install cargo-atcoder
    mkdir ~/.cache/cargo-atcoder
fi

read -n1 -p "do u wanna install cargo-maker? (y/N): " yn
echo ""
if [[ $yn = [yY] ]]; then
    cargo install cargo-make
fi

read -n1 -p "do u wanna install cargo-generate? (y/N): " yn
echo ""
if [[ $yn = [yY] ]]; then
    cargo install cargo-generate
fi

curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh
