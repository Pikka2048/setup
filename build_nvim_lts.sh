#!/bin/bash
set -e

sudo apt update
sudo apt install -y ninja-build gettext cmake unzip curl build-essential

cd /tmp
git clone https://github.com/neovim/neovim
cd neovim

git checkout stable

make distclean
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

hash -r
which nvim
nvim --version

echo "nvim build success!"
