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