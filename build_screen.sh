#!/bin/bash
set -e

sudo apt update
sudo apt install -y build-essential libncurses-dev libpam0g-dev

cd /tmp
wget https://ftp.jaist.ac.jp/pub/GNU/screen/screen-5.0.1.tar.gz
tar xzf screen-5.0.1.tar.gz
cd screen-5.0.1

./configure --prefix=/usr/local --enable-colors256 --with-pam

make
sudo make install

hash -r

which screen
screen --version

echo "screen build sccess!"
