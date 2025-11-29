#!/bin/bash
set -e

sudo apt update -y
sudo apt install -y golang

go install golang.org/x/tools/gopls@latest

go version
