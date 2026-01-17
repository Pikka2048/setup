#!/bin/bash
set -e

if command -v apt &> /dev/null; then
  sudo apt update -y
  sudo apt install -y golang
elif command -v dnf &> /dev/null; then
  sudo dnf install -y golang
else
  echo "apt または dnf が見つかりません。"
  exit 1
fi

go install golang.org/x/tools/gopls@latest

go version
