#!/bin/bash
set -e

if command -v apt &> /dev/null; then
  sudo apt update
  sudo apt install -y nodejs npm
  REMOVE_CMD="sudo apt purge -y nodejs npm"
elif command -v dnf &> /dev/null; then
  sudo dnf install -y nodejs npm
  REMOVE_CMD="sudo dnf remove -y nodejs npm"
else
  echo "apt または dnf が見つかりません。"
  exit 1
fi

sudo npm install -g n

sudo n lts

${REMOVE_CMD}

node -v
npm -v
