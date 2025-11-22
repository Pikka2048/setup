#!/bin/bash
set -e

sudo apt update
sudo apt install -y nodejs npm

sudo npm install -g n

sudo n lts

sudo apt purge nodejs npm

node -v
npm -v
